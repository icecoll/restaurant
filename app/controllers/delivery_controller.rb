class DeliveryController < ApplicationController
  def index
    @menu=Menu.page params[:page]
  end
end
