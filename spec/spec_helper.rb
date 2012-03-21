require 'simplecov'
require 'redis'
require 'cashier_cotendo'

SimpleCov.start

$: << File.join(File.dirname(__FILE__), '..', 'lib')

ENV['RAILS_ENV'] = 'test'

require 'fileutils'

RSpec.configure do |config|

  config.before(:suite) do
    $redis = Redis.new(:host => '127.0.0.1', :port => 6379)
  end

  config.before(:each) do
    $redis.flushdb
  end

  config.after :suite do
    
  end
  
end
