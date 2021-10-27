class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @calories = Calorie.all.order("created_at DESC")
  end

  def show
    @calorie = Calorie.find(params[:id])
  end

  def edit
    @calorie = Calorie.find(params[:id])
  end


  def destroy
    @calorie.destroy
    redirect_to foods_path
  end

  private

  def calorie_params
    params.require(:calorie).permit(:food, :calorie, :image, :memo, :start_time).merge(user_id: current_user.id)
  end

end
