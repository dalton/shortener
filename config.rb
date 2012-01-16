require 'yaml'
LINKSTORE_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'link_stores', 'config.yml'))
require_relative 'link_stores/link_store_development'
require_relative 'link_stores/link_store_test'


if ENV['RACK_ENV'] == 'test'
  LINKSTORE = LinkStoreTest
else
  LINKSTORE = LinkStoreDevelopment
end