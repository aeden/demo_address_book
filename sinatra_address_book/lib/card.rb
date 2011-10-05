class Card
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

  def self.clear
    @cards = []
  end

  def self.create!(attributes = {})
    card = Card.new
    attributes.each do |k, v|
      card.send("#{k}=", v)
    end
    cards << card
    card
  end

  def to_json(*a)
    serialized_hash.to_json(*a)
  end

  def serialized_hash
    {
      'first_name' => first_name,
      'last_name' => last_name
    }
  end
end
