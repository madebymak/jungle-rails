class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(order)
    @order = order
    mail(to: 'mr.jmak@gmail.com',
         subject: "Order # #{@order.id} from Jungle.com"
          )
  end
end
