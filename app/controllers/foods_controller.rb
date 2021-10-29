class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_calorie, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index, :new, :create, :update, :destroy, :show, :search]

  def index
    @calories = Calorie.all.order("created_at DESC")
  end

  def show
    @messages = @calorie.messages.includes(:user)
    @message = Message.new
  end
  

  def edit
  end

  def destroy
    @calorie.destroy
    redirect_to foods_path
  end

  def search
    @calories = Calorie.search(params[:keyword])
  end

  private

  def calorie_params
    params.require(:calorie).permit(:food, :calorie, :image, :memo, :start_time, :user).merge(user_id: current_user.id)
  end

  def set_calorie
    @calorie = Calorie.find(params[:id])
  end

  def move_to_index
    unless @calorie.user.id == current_user.id
      redirect_to action: :index
    end
  end

end
