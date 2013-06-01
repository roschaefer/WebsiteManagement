class UserMailer < Devise::Mailer

  def credentials_mail(user)
    @resource = user
    mail(:from  => 'noreply@joschaefer.com', :to => @resource.email, :subject => "Welcome to the Website Management System")
  end




end
