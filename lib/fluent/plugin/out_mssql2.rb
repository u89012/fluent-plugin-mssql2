# require 'pp'
# require 'logger'

class Mssql2Output < Fluent::BufferedOutput
  Fluent::Plugin.register_output('mssql2', self)

  include Fluent::SetTimeKeyMixin
  include Fluent::SetTagKeyMixin

  config_param :username, :string
  config_param :password, :string
  config_param :host, :string
  config_param :database, :string
  config_param :table, :string  

  def configure(conf)
    super
    require 'sequel'
    require 'json'

    @format_proc = Proc.new{|tag, time, record| record.to_json}
  end

  def format(tag, time, record)
    [tag, time, @format_proc.call(tag, time, record)].to_msgpack
  end

  def client
    begin
      db = Sequel.tinytds(username: @username, password: @password, host: @host, database: @database)
      # db.loggers << Logger.new($stdout)
    rescue
      raise Fluent::ConfigError, "Cannot open database, check user or password"
    end  
    db
  end

  def write(chunk)    
    a = []
    c = client

    chunk.msgpack_each{|tag, time, data|
      a << JSON.parse(data)
    }

    # pp a
    begin
      c[@table.to_sym].multi_insert(a)    
    ensure
      c.disconnect
    end
  end
end
