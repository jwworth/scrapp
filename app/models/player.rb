class Player < ActiveRecord::Base

  ### VALIDATIONS
  validates_presence_of   :name
  validates_length_of     :name, maximum: 15
  validates_uniqueness_of :name

  ### CALLBACKS
  before_save :standardize_capitalization

  def standardize_capitalization
    self.name = self.name.downcase.titleize
  end
end

