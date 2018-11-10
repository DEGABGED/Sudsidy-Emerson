class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def show
  end

  def index
    # Get aggregate data here
  end

  private
  def set_card
    @card = Card.where(sid: params[:id]).first
  end
end
