# frozen_string_literal: true
# require 'sidekiq'

# Sidekiq.configure_server do |config|
#   config.redis = { url: 'redis://localhost:6379/0' }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://localhost:6379/0' }
# end




# schedule_file = "config/schedule.yml"
# if File.exist?(schedule_file) && Sidekiq.server?
#   Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
# end

# REDIS = Redis.new(host: 'localhost', port: 3000)
# schedule_file = "config/schedule.yml"
#  if File.exist?(schedule_file) && Sidekiq.server?
#    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
#  end





# if Rails.env == "development"
#    Sidekiq.configure_server do |config|
#      config.redis = { url: ENV['REDIS_URL'] }
#    end

#    Sidekiq.configure_client do |config|
#      config.redis = { url: ENV['REDIS_URL'] }
#    end
#  else
#    Sidekiq.configure_server do |config|
#      config.redis = {url: 'redis://localhost:6379/0'}
#    end
#    Sidekiq.configure_client do |config|
#      config.redis = {url: 'redis://localhost:6379/0'}
#    end
#  end

#  schedule_file = "config/schedule.yml"
#  if File.exist?(schedule_file) && Sidekiq.server?
#    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
#  end






