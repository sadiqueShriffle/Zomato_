# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'sadiquea@shriffle.com'
  layout 'mailer'
end
