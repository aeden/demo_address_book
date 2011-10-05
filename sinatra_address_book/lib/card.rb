class Card
  attr_accessor :first_name
  attr_accessor :last_name

  def self.last
    Card.new
  end

  def to_json
    JSON.generate(attributes)
  end

  def attributes
    {
      'first_name' => first_name,
      'last_name' => last_name
    }
  end
end
