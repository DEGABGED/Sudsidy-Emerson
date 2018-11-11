class PumpsController < ApiController
  def create
    @scanner = Scanner.where(key: params[:scanner_id]).first
    @card = Card.where(sid: params[:card_id]).first
    is_valid = 1

    if !@scanner
      # return error JSON
      json_response({message: "Sorry, scanner not found."}, :not_found)
      return
    end

    if !@card || !(@card.has_redeemable())
      is_valid = 0
    end

    @pump = Pump.create(card: @card, scanner: @scanner, is_valid: is_valid)

    if is_valid == 1
      @card.sanitize_hands
      json_response(@pump, :created)
    else
      json_response({message: "Card doesn't exist or has already redeemed."}, :ok)
    end
  end

  private

  def pump_params
    params.permit(:card_id, :scanner_id)
  end
end
