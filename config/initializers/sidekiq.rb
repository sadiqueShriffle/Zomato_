# frozen_string_literal: true

# Sidekiq.configure_server do |config|
#   config.redis = { url: 'redis://redis.example.com:7372/0' }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://redis.example.com:7372/0' }
# end

REDIS = Redis.new(host: 'localhost', port: 3000)
