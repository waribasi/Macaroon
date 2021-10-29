class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id, calorie_id: params[:calory_id])
  end

end
