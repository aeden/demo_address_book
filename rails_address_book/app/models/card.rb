class Card < ActiveRecord::Base
  has_many :emails
  accepts_nested_attributes_for :emails

  def as_json(options={})
    super (options || {}).merge(:methods => :emails)
  end
end
