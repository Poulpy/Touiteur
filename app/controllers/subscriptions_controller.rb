class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.all
    @users = User.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @users = User.all
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    # @user = current_user
    # Subscription.create follower_id: @user.id, followed_id: params[:user][:id]
    # redirect_to subscriptions_path
    @sub = Subscription.new(subscription_params)

    respond_to do |format|
      if @sub.save
        format.html { redirect_to subscriptions_path, notice: 'Sub was successfully created.' }
        format.json { render :show, status: :created, location: @sub }
        format.js
      else
        format.html { render :new }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @user = current_user
    # BEWARE
    # .find.destroy
    # .where.destroy_all
    #Subscription.where(follower_id: current_user.id, followed_id: params[:user][:id]).destroy_all
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    redirect_to subscriptions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:follower_id, :followed_id)
    end
end
