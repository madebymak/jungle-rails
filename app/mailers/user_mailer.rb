class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(order)
    @order = order
    @url  = 'http://example.com/login'
    @product = Product.joins(:line_items).where('line_items.order_id' => order.id).select('products.name, products.description, line_items.quantity, line_items.item_price_cents, line_items.total_price_cents')
    mail(to: 'mr.jmak@gmail.com',
         subject: "Order ##{@order.id} from Jungle.com"
          )
  end
end
