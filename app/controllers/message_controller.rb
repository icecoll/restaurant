class MessageController < ApplicationController

  def index
    @feedback_messages=Feedback.page params[:page]
  end

  def new
  end

  def create
    @feedback_message = Feedback.new(feedback_params)
    @feedback_message.save
    render index
  end

  private
  def feedback_params
    params.require(:feedback).permit(:user,:subject,:content)
  end
end
