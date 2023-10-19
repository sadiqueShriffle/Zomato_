# frozen_string_literal: true

class MyFirstJob
  include Sidekiq::Job

  def perform(*_args)
    UserMailer.welcome_email(user)
    # puts "I am #{name}, running my first job at #{age}"
  end
end
