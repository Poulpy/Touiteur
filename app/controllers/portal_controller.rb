class PortalController < ApplicationController
  #before_action :is_allowed, only: [:tweets_page, :follow, :unfollow, :show, :create]
    
  before_action :authenticate_user!

  include ApplicationHelper

  def index
    
  end

  def login

  end

  def check
  
  end

  def tweets_page
   
  end

  def logout
   
  end

  def create
   
  end

  # show all users
  def show

  end




  private

  def get_params_form
   
  end

  def is_allowed
   
  end




end
