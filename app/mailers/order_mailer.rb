class OrderMailer < ApplicationMailer
  def order_email 
    @order = params[:user]
    byebug
    mail(to: @order.email, subject: "Order Created Successfully !!")
  end
end
