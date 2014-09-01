class Game < ActiveRecord::Base
  ### ASSOCIATIONS
  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  ### VALIDATIONS
  validates_presence_of :winner_id
  validates_presence_of :winner_score
  validates_presence_of :loser_id
  validates_presence_of :loser_score

  ### CALLBACKS
  before_create :set_default_bingos

  def set_default_bingos
    self.bingos ||= 0
  end
end
