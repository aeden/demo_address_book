class V1::CardsController < ApplicationController
  respond_to :json

  def create
    emails_attributes = params.delete(:emails)
    params[:card].merge!(:emails => emails_attributes.map{ |email_attributes| Email.new(email_attributes) }) if emails_attributes

    card = Card.new(params[:card])
    card.save!
    respond_with(card)
  end

end
