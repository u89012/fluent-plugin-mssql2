# Fluent::Plugin::Mssql2

A no frills fluentd buffered plugin to write to microsoft sql server. Uses tiny_tds and sequel for the actual weightlifting.

## Requirement

You should install and setup following packages;

- unixODBC [http://www.unixodbc.org/]
- freeTDS [http://www.freetds.org/]

## Installation

Install Ruby and any prerequisites (assuming Debian distro)

```
sudo apt-get install build-essential ruby2.0 ruby-dev unixODBC freetds-dev
```

Install Fluentd gem. Follow the well written documentation [http://docs.fluentd.org/articles/install-by-gem]


Install fluent-plugin-mssql2 gem and its deps

```
sudo gem install sequel tiny_tds fluent-plugin-mssql2
```

Alternatively, add this line to your application's Gemfile:

    gem 'tiny_tds'
    gem 'sequel'
    gem 'fluent-plugin-mssql2'

And then execute:

    $ bundle


## Usage

```
<match insert.into.mssql2.*>
    type     mssql2
    username sa
    password secret
    host     foo
    database bar
    table    baz
    
    flush_interval 15s
</match>
```

## THANKS

Hidemasa Togashi for his work on fluent-plugin-mssql [https://github.com/htgc/fluent-plugin-mssql] on which this is based


## LICENCE

- MIT

## Contributing

1. Fork it ( http://github.com/u89012/fluent-plugin-mssql2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
