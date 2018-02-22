class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render json: @messages
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      ActionCable.server.broadcast 'room_channel', content: @message.content, username: @message.username, timestamp: @message.timestamp
    else
      render json: {error: "could not send message"}, status: 400
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :content)
  end
end
