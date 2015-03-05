
class Users::SessionsController < Devise::SessionsController

  def new

  end

  def list

  end

  def create

    @mail=params[:user][:email].downcase
    $mail=@mail

    if user_signed_in?

      @post=User.where(:utype =>"admin",:email=>@mail)

        if @post.length==0

            redirect_to "http://localhost:3000/users/user_page"
            # render 'users/user_page'
        else
          redirect_to'http://localhost:3000/users/admin_page'

          # render 'users/admin_page'
        end

    else

        super
    end

  end

end


