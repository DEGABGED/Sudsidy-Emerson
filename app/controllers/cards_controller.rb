class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def show
  end

  def index
    # Get aggregate data here
    @stations = Station.all

    # If there is a thing
    @station = Station.first
    if params[:station]
      @station = Station.find(params[:station])
    end
    @pumps = @station.pumps
  end

  def search
    # Load the card_search page here
  end

  private
  def set_card
    @card = Card.where(sid: params[:id]).first
  end
end
