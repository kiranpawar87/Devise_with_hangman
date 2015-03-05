class UsersController < ApplicationController

  def index
    @posts = User.new
  end


  def new
    @posts = User.new
  end

  def user_page

    p "page called"
    @i=0
    session[:i]=@i

    if user_signed_in?


    else

      redirect_to new_user_session_path

      return

    end

  end

  def list
    @posts = User.all
    p "all records................#{@post}"
    render 'users/User_list'
  end

  def edit_user

    @uid=params[:id]
    session[:uid]=@uid

    @fname=User.where(:id=>@uid).first.fname
    @lname=User.where(:id=>@uid).first.lname
    @uname=User.where(:id=>@uid).first.uname
    @email=User.where(:id=>@uid).first.email

    render 'users/update'

  end

  def manage
    @posts = User.all
    p "Manage all Records................#{@posts}"
    render 'users/edit_user'
  end

  def delete
    @uid=params[:id]
    # User.find(:id=>@uid).destroy
    User.find(@uid).destroy
    p "destroy........."
    render 'users/edit_user'
  end


  def reset

    @uid=session[:uid]
    @f=params[:user][:fname]
    @l=params[:user][:lname]
    @u=params[:user][:uname]
    @e=params[:user][:email]

     item = User.find(@uid)
    item.fname=@f
    item.lname=@l
    item.uname=@u
    item.email=@e
    item.save

    render 'users/admin_page'

  end

end
