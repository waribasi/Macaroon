class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    else
      @calorie = @message.calorie
      @messages = @calorie.messages
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    # show2_caloryのパスに戻れるようにする
    redirect_to root_path
  end

  # show2_calory

  private

  def calorie_params
    params.require(:calorie).permit(:food, :calorie, :image, :memo, :start_time).merge(user_id: current_user.id)
  end


  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id, calorie_id: params[:calory_id])
  end

end
