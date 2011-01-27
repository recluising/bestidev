
class OrderMailer < ActionMailer::Base
  helper "spree/base"

  def confirm_email(order, resend=false)
    @order = order
    subject = (resend ? "[RESEND] " : "")
    subject += "#{Spree::Config[:site_name]} DEVELOPMENT Confirmación del pedido ##{order.number}"
    mail(:to => order.email,
         :subject => subject)
  end

  def cancel_email(order, resend=false)
    @order = order
    subject = (resend ? "[RESEND] " : "")
    subject += "#{Spree::Config[:site_name]} DEVELOPMENT Cancelación del pedido  ##{order.number}"
    mail(:to => order.email,
         :subject => subject)
  end
end
