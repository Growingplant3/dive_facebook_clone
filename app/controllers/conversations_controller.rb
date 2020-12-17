class ConversationsController < ApplicationController
  before_action :set_conversations

  def index
    @conversations = Conversation.all
  end

  def create
    redirect_to root_path unless logged_in?
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def set_conversations
    @conversation = Conversation.find(params[:conversation_id])
  end
end
