class CardsController < ApplicationController
  respond_to :json, :json_v1, :json_v2, :xml

  def index
    respond_with(Card.all)
  end

  def show
    respond_with(Card.find(params[:id]))
  end

  def create
    if request.format.symbol == :json_v2
      name = params[:name]
      params[:card].merge!(:first_name => name[:first], :last_name => name[:last], :display_name => name[:display]) if name
    end

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

  def destroy
    card = Card.find(params[:id])
    card.destroy
    respond_with(card)
  end
end
