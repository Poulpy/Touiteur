class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_user, only: [:show]

  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @subscription = Subscription.where(follower_id: current_user.id,
                                       followed_id: @user.id).first
  end

  def update
    respond_to do |format|
      if @user.update(tweet_params)
        format.html { redirect_to new_tweet_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
        format.js
      else
        format.html { redirect_to new_tweet_path, notice: 'Problem' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, tweets_attributes: [:user_id, :tweet_id, :_destroy])
    end

    def tweet_params
      params.require(:user).permit(tweets_attributes: [:content, :user_id, :tweet_id, :_destroy])
    end
end
