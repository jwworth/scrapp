winner = Player.create!(name: 'jack')
loser  = Player.create!(name: 'jill')

10.times do |i|
  winner_score, loser_score = rand(250..300), rand(150..220)
  puts "Creating game ##{i}"
  Game.create!(winner: winner, winner_score: winner_score, loser: loser, loser_score: loser_score)
end
