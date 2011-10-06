class Card < ActiveRecord::Base
  has_many :emails
  accepts_nested_attributes_for :emails

  def as_json(options={})
    super (options || {}).merge(:methods => :emails)
  end

  def to_json_v1(options={})
    to_json(options)
  end

  def to_json_v2(options={})
    {
      'name' => {
        'first' => first_name,
        'last' => last_name,
        'display' => display_name
      }
    }.to_json(options)
  end

end
