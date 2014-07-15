Gem::Specification.new do |s|
  s.name        	= 'fluent-plugin-mssql2'
  s.version     	= '0.0.8'
  s.date        	= '2014-07-10'
  s.summary     	= 'A no frills fluentd buffered plugin to write to microsoft sql server'
  s.description    	= 'A no frills fluentd buffered plugin to write to microsoft sql server'
  s.email        	= 'u89012@gmail.com'
  s.authors     	= ['u89012']
  # s.require_paths   = ['lib']
  s.files         = ["lib/fluent/plugin/out_mssql2.rb"]
  s.add_dependency 	'sequel', '~> 4.8'
  s.add_dependency 	'tiny_tds', '~> 0.6'
  s.homepage 		= 'http://github.com/u89012/fluent-plugin-mssql2'
  s.license 		= 'MIT'
end
