# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_email
    @order = params[:user]
    mail(to: @order.email, subject: 'Order Created Successfully !!')
  end
end
