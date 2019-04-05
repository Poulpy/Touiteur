class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :show]


  def index
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      #@user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
