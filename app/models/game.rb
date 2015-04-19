class Game < ActiveRecord::Base

  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  validates_presence_of :winner_id
  validates_presence_of :winner_score
  validates_presence_of :loser_id
  validates_presence_of :loser_score
  validates_numericality_of :winner_score, greater_than: proc { |game| game.loser_score },
                                           message: 'must be greater than Loser score'
  before_create :set_default_bingos

  def set_default_bingos
    self.bingos ||= 0
  end

  def winner_name
    winner.name
  end

  def loser_name
    loser.name
  end
end
