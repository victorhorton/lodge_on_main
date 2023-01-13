class UsersController < ApplicationController

  # before_action :confirm_logged_in, except: [:login, :attempt_login]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!
    
    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  def edit
    @user = User.find(session[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Settings Updated"
      redirect_to root_path
    else
      flash.now[:warn] = "#{@user.errors.full_messages.join(', ')}"
      render :edit 
    end      
  end

  def login
  end

  def log_out
    session_params.map { |p| session.delete(p) }
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end

  def attempt_login
    return unless params[:email].present? && params[:password].present?
    found_user = User.find_by(email: params[:email])

    if found_user
      @authenticated_user = found_user.authenticate(params[:password])
    end

    if @authenticated_user
      session[:id] = @authenticated_user.id
      session[:name] = @authenticated_user.name

      redirect_to root_path
      flash[:notice] = 'Login success'
    else
      flash.now[:warn] = 'Login Failed'
      render :login
    end
  end

private

  def session_params
    [:id, :name]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
