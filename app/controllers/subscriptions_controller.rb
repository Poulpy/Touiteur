class SubscriptionsController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_subscriptions, only: [:create, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.where(follower_id: current_user.id)
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
    @subscriptions = Subscription.all
    @sub = Subscription.new(subscription_params)

    respond_to do |format|
      if @sub.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: current_user).follow_email(current_user).deliver_now

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
    # BEWARE
    # .find.destroy
    # .where.destroy_all
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to subscription, notice: 'Sub was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriptions
      @subscriptions = Subscription.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:follower_id, :followed_id)
    end
end
