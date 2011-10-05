class CardsController < ApplicationController
  respond_to :json

  def index
    respond_with(Card.all)
  end

  def create
    emails_attributes = params.delete(:emails)
    params[:card].merge!(:emails => emails_attributes.map{ |email_attributes| Email.new(email_attributes) }) if emails_attributes

    card = Card.new(params[:card])
    card.save!
    respond_with(card)
  end

  def update
    emails_attributes = params.delete(:emails)
    params[:card].merge!(:emails => emails_attributes.map{ |email_attributes| Email.new(email_attributes) }) if emails_attributes

    card = Card.find(params[:id])
    card.update_attributes(params[:card])
    respond_with(card) do |format|
      format.json { render :json => card }
    end
  end
end
