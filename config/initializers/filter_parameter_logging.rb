# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Configure parameters to be filtered from the log file. Use this to limit dissemination of
# sensitive information. See the ActiveSupport::ParameterFilter documentation for supported
# notations and behaviors.
Rails.application.config.filter_parameters += %i[
  passw secret token _key crypt salt certificate otp ssn
]

def ransackable_associations(auth_object = nil)
  Rails.logger.info('WITHIN RANSACK ASSOCIATION')
  super + %w[impressionable]
end
