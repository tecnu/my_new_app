class UserMailer < ApplicationMailer
  default from: "hello@bakeshop.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         :to => 'smsmith93@gmail.com',
         :subject => "A new contact form message from #{name}")
  end
  
end
