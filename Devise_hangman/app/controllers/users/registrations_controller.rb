class Users::RegistrationsController < Devise::RegistrationsController
  require 'net/smtp'
  def new
    p "calles new"
    super
  end

  def create

    build_resource(sign_up_params)
    super



    msg = "Subject: Reset Password\n\nHi User, \n\n\tThanks for sign up..\n"

    smtp = Net::SMTP.new 'smtp.gmail.com', 587

    smtp.enable_starttls

    smtp.start("smtp.gmail.com","kdkaushikdalvi@gmail.com", "radhe@123", :login) do

     @abc=smtp.send_message(msg, "kdkaushikdalvi@gmail.com","kaushik@iternia.com")

      p @abc
  
    end

  end

  def destroy
      redirect_to root_path
      super
  end

  def build_resource(sign_up_params)
    super
    self.resource.wins = 0
    self.resource.lose = 0
    self.resource.utype = "user"

  end

end

