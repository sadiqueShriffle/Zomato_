# frozen_string_literal: true

class MyFirstJob
  include Sidekiq::Job

  def perform(email)
    byebug  
    # UserMailer.welcome_email(email)
    puts "I am , running my first job at #{email} "
  end
end
