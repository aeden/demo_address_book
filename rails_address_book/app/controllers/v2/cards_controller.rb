class V2::CardsController < ApplicationController
  respond_to :json

  def create
    name_attributes = params.delete(:name)
    params[:card].merge!({
      :first_name => name_attributes[:first],
      :last_name => name_attributes[:last],
      :display_name => name_attributes[:display]
    })

    emails_attributes = params.delete(:emails)
    params[:card].merge!(:emails => emails_attributes.map{ |email_attributes| Email.new(email_attributes) }) if emails_attributes

    card = Card.new(params[:card])
    card.save!
    respond_with(card)
  end
end
