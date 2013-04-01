class UserMailer < Devise::Mailer

  def credentials_mail(user)
    @resource = user
    mail(:to => @resource.email, :subject => "Welcome to the Website Management System")
  end




end
