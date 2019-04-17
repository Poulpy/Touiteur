class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_user, only: [:show]


  def index
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  def update
    puts params

    # # extracting the tags from the content of the touit
    # content = params[:tweet][:content]
    # @tweet.tag_names = content.scan(/#[A-Za-z0-9]*/)

    # # creating the links for each tag
    # tag_hash = Hash.new
    # @tweet.tag_names.each do |tag|
    #   word = tag[1..-1]# we erase the first character, #, for the link
    #   tag_hash[tag] = link_to tag, tweets_path(tag: word)
    # end

    # # replacing tags with links
    # tag_hash.each do |k, v|
    #   content.gsub! k, v
    # end

    # @tweet.content = content


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
