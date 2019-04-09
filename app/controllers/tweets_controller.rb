class TweetsController < ApplicationController
  include ActionView::Helpers::UrlHelper

  before_action :authenticate_user!
  load_and_authorize_resource
    
  before_action :set_tweet, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :set_tweets, only: [:index, :create]


  # GET /tweets
  # GET /tweets.json
  def index
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])
  end


  # GET /tweets/new
  def new
    #@tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)

    # extracting the tags from the content of the touit
    content = params[:tweet][:content]
    @tweet.tag_names = content.scan(/#[A-Za-z0-9]*/)

    # creating the links for each tag
    tag_hash = Hash.new
    @tweet.tag_names.each do |tag|
      word = tag[1..-1]# we erase the first character, #, for the link
      tag_hash[tag] = link_to tag, tweets_path(tag: word)
    end

    # replacing tags with links
    tag_hash.each do |k, v|
      content.gsub! k, v
    end

    @tweet.content = content


    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
        format.js
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweets_path, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def like
    @like = Like.new(tweet_id: @tweet.id, user_id: current_user.id)

    if @like.save
      flash[:success] = 'Vous avez laiké un touit !'
    end

    redirect_to tweets_path
  end


  def unlike
    @like = Like.where(tweet_id: @tweet.id, user_id: current_user.id).first
    @like.destroy if @like
    redirect_to tweets_path
  end


  def reply
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def set_tweets
      # if the user wants to see the tags related to a tag
      if params.has_key? :tag 
        @tweets = Tweet.accessible_by(current_ability).tagged_with(:names => ["#"+params[:tag]], match: :any)
      else
        @tweets = Tweet.accessible_by(current_ability).where(tweet_id: nil)
      end

      @tweets = @tweets.order("created_at DESC").page(params[:page]).per(5)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id, :tweet_id)
    end

    def like_params
      params.require(:like).permit(:user_id, :tweet_id)
    end
end
