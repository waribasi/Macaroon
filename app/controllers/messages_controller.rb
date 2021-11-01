class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    else
      # 送信に失敗した時の正しい処理をするようにする
      @calorie = @message.calorie
      @messages = @calorie.messages
    end
  end

  private

  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id, calorie_id: params[:calory_id])
  end

end
