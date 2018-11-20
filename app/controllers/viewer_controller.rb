class ViewerController < ApplicationController
  before_action :authenticate_admin!

  def index
    # Get aggregate data here
    @cards = Card.all
    @scanners = Scanner.all
    @pumps = Pump.all
    @stations = Station.all

    # If there is a thing
    @station = Station.first
    if params[:station]
      @station = Station.find(params[:station])
    end

    # Filter the pumps
    if params[:created_at] && params[:created_at].length > 0
      @pumps = @pumps.where(
        'created_at BETWEEN ? AND ?',
        params[:created_at].to_date.beginning_of_day,
        params[:created_at].to_date.end_of_day
      )
    end

    # Chart data
    @valids = @pumps.group(:is_valid).count

    # Chart data fabrication
    @total_pumps = [
      ["2 PM", 32],
      ["3 PM", 40],
      ["4 PM", 45],
      ["5 PM", 42],
      ["6 PM", 59],
      ["7 PM", 65],
      ["8 PM", 66],
      ["9 PM", 52],
      ["10 PM", 30],
    ]
    @points_rewarded = [
      ["2 PM", 30],
      ["3 PM", 30],
      ["4 PM", 40],
      ["5 PM", 42],
      ["6 PM", 52],
      ["7 PM", 45],
      ["8 PM", 60],
      ["9 PM", 51],
      ["10 PM", 30],
    ]
    @no_scans = [
      ["2 PM", 2],
      ["3 PM", 10],
      ["4 PM", 15],
      ["5 PM", 4],
      ["6 PM", 9],
      ["7 PM", 6],
      ["8 PM", 16],
      ["9 PM", 2],
      ["10 PM", 0],
    ]
    @points_spent = [
      ["Nov 15 2018", 250],
      ["Nov 16 2018", 275],
      ["Nov 17 2018", 200],
      ["Nov 18 2018", 375],
      ["Nov 19 2018", 300],
      ["Nov 20 2018", 325],
    ]
  end

  def csv
    respond_to do |format|
      format.csv {send_data Pump.all.to_csv}
    end
  end
end
