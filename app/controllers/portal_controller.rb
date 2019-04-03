class PortalController < ApplicationController
  before_action :is_allowed, only: [:tweets_page]
  include ApplicationHelper

  def index
    
  end

  def login

  end

  def check
    @user = User.where(name: params[:user][:name], password:params[:user][:password]).first
    if @user
      session[:connected] = true
      session[:user] = @user
      flash[:message] = 'You are connected'
      redirect_to "/user_page"
    else
      flash[:message] = 'Username or password incorrect'
      redirect_to "/login"
    end
  end

  def tweets_page
    # the page must display the tweets of the users the current_user is 
    # following
    #@tweets = current_user.followeds.page(1).per(5)
    #@tweets = User.find(current_user.id).followeds.page(1)

    #@tweets = Tweet.page(params[:page]).per(5)
    #@tweets = Tweet.where(user_id:).page(params[:page]).per(5)
  end

  def logout
    session[:connected] = nil
    redirect_to '/login'
  end

  def create
    @content = params[:tweet][:content]
    @user_id = session[:user]['id'].to_i
    if Tweet.create content:@content, user_id: @user_id
      flash[:message] = 'Vous avez envoyé un Tweet'
    else
      flash[:message] = 'ça match pas'
    end
    redirect_to user_page_path
  end

  # show all users
  def show
    @users = User.all

  end

  def follow
    @user = current_user
    Subscription.create follower_id: @user.id, followed_id: params[:user_id]
    redirect_to '/user_page'
  end

  def unfollow
    @user = current_user
    puts @user
    puts @user.id
    puts params[:user_id]
    # BEWARE
    # .find.destroy
    # .where.destroy_all
    Subscription.where(follower_id: @user.id, followed_id: params[:user_id]).destroy_all
    redirect_to '/user_page'
  end


  private

  def get_params_form
    params.require(:user).permit(:name, :password)
  end

  def is_allowed
    if !session[:connected]
      return head :forbidden
    end
  end




end
