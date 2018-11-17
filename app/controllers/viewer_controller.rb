class ViewerController < ApplicationController
  before_action :authenticate_admin!

  def index
    @cards = Card.all
    @scanners = Scanner.all
    @pumps = Pump.all
  end
end
