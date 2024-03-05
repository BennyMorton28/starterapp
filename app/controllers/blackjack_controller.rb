class BlackjackController < ApplicationController
  before_action :require_user

  def index
    if params[:player_card_1]
      player_hand = [params[:player_card_1], params[:player_card_2]]
      dealer_card = params[:dealer_card]
      @advice = decide_action(player_hand, dealer_card)
    end
  end

  private

  def decide_action(player_hand, dealer_card)
    player_total = calculate_total(player_hand)
    dealer_total = card_value(dealer_card)

    if player_total <= 11
      'Hit'
    elsif player_total >= 17
      'Stand'
    elsif player_total > 11 && player_total < 17 && dealer_total < 7
      'Stand'
    else
      'Hit'
    end
  end

  def calculate_total(hand)
    total = 0
    hand.each do |card|
      total += card_value(card)
    end
    total
  end

  def card_value(card)
    if card.match?(/\d/)
      card.to_i
    elsif ['J', 'Q', 'K'].include?(card)
      10
    else # Ace
      11
    end
  end
end
