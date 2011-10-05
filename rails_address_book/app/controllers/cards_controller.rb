class CardsController < ApplicationController
  respond_to :json

  def index
    respond_with(Card.all)
  end

  def create
    emails_attributes = params.delete(:emails)
    card = Card.new(params[:card].merge(:emails => emails_attributes.map { |email_attributes| Email.new(email_attributes) }))
    card.save!
    respond_with(card)
  end
end
