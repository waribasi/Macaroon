class CaloriesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_calorie, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index, :new, :create, :update, :destroy, :show]

  def index
    @calories = Calorie.all.order("created_at DESC")
  end

  def new
    @calorie = Calorie.new
  end

  def create
    @calorie = Calorie.new(calorie_params)
    if @calorie.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @calorie.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @calorie.update(calorie_params)
    redirect_to calory_path(@calorie.id)
  end

  private

  def calorie_params
    params.require(:calorie).permit(:food, :calorie, :image, :memo, :start_time).merge(user_id: current_user.id)
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
