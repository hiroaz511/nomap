class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}
  def index
    @user=User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    # @shop = Shop.where(user_id: params[:id]).order(created_at: :desc)
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], user_image: params[:user_image])
    require 'date'
    time = Time.now

    if params[:user_image]
      @user.user_image= "#{time}.jpg"
      image = params[:user_image]
      File.binwrite("public/#{@user.user_image}",image.read)
    else
      @user.user_image= "no-image.png"
    end

    if @user.save
       session[:user_id] = @user.id
       flash[:notice] = "ユーザー登録が完了しました"
       redirect_to("/users/#{@user.id}")
    else
       render("users/new")
    end
  end

  def edit
  end

  def update
  end

  def login_form
    @user=User.find_by(id: params[:id])
  end

  def login
    @user=User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message="メールアドレスまたはパスワードが間違っています"
      @email=params[:email]
      @password=params[:password]
      render("users/login_form")
    end
  end

  def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/users/index")
    end
  end

end