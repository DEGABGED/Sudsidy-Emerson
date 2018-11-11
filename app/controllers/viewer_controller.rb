class ViewerController < ApplicationController
  def index
    @cards = Card.all
    @scanners = Scanner.all
    @pumps = Pump.all
  end
end
