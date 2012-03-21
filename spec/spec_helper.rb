require 'simplecov'
require 'redis'

SimpleCov.start

$: << File.join(File.dirname(__FILE__), '..', 'lib')

require 'cashier'

ENV['RAILS_ENV'] = 'test'
require 'dummy/config/environment'

require 'rspec/rails'

require 'fileutils'

RSpec.configure do |config|
  # ==========================> Redis test configuration
  REDIS_PID = Rails.root.join 'tmp', 'pids', 'redis.pid'

  FileUtils.mkdir_p Rails.root.join 'tmp', 'pids'
  FileUtils.mkdir_p Rails.root.join 'tmp', 'cache'

  config.before(:suite) do
    redis_options = {
      "daemonize"     => 'yes',
      "pidfile"       => REDIS_PID,
      "port"          => 6397,
      "dir"           => Rails.root.join('tmp', 'cache'),
    }.map { |k, v| "#{k} #{v}" }.join('\n')
    `echo '#{redis_options}' | redis-server -`
  end

  config.before(:each) do
    Rails.cache.clear
  end

  config.after :suite do
    Process.kill "TERM", File.read(REDIS_PID).to_i
  end
end
