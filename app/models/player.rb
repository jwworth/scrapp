class Player < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, maximum: 15
  validates_uniqueness_of :name

  before_save :standardize_capitalization

  def standardize_capitalization
    self.name = name.downcase.titleize
  end
end
