jack = Player.create!(name: 'jack')
jill = Player.create!(name: 'jill')

10.times do |i|
  rand(2) == 1 ? winner, loser = jack, jill : winner, loser = jill, jack
  winner_score, loser_score = rand(250..300), rand(150..220)

  puts "Creating game ##{i}"
  Game.create!(winner: winner, winner_score: winner_score, loser: loser, loser_score: loser_score, bingos: rand(2))
end
