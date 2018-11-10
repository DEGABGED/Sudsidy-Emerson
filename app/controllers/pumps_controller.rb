class PumpsController < ApiController
  def create
    @scanner = Scanner.where(key: params[:scanner_id]).first
    @card = Card.where(sid: params[:card_id]).first
    if !@scanner || !@card
      # return error JSON
      json_response({message: "Sorry, scanner or card not found."}, :not_found)
      return
    end

    @pump = Pump.create(card: @card, scanner: @scanner)

    if !(@card.has_redeemable())
      json_response({message: "Card has already redeemed."}, :ok)
      return
    end

    @card.sanitize_hands
    json_response(@pump, :created)
  end

  private

  def pump_params
    params.permit(:card_id, :scanner_id)
  end
end
