require 'sinatra'
require 'haml'
require 'yaml'

set :bind, '0.0.0.0'

app_yml = '/app/config.yml'
app_config = YAML.load_file(app_yml)
config_yml = '/etc/homedepot/config/envconfig.yml'
config = File.exist?(config_yml) ? YAML.load_file(config_yml) : {}



get '/' do
  @settings = File.exist?(config_yml) ? config : app_config
  haml :index
end
