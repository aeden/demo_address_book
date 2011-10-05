class Card
  attr_accessor :id
  attr_accessor :first_name
  attr_accessor :last_name

  def self.last
    cards.last 
  end

  def self.cards
    @cards ||= []
  end

  def self.all
    cards
  end

  def self.find(id)
    cards.find { |card| card.id.to_s == id.to_s }
  end

  def self.clear
    @cards = []
  end

  def self.create!(attributes = {})
    card = Card.new
    attributes.each do |k, v|
      card.send("#{k}=", v)
    end
    card.id = cards.length + 1
    cards << card
    card
  end

  def to_json(*a)
    serialized_hash.to_json(*a)
  end

  def serialized_hash
    {
      'id' => id,
      'first_name' => first_name,
      'last_name' => last_name
    }
  end
end
