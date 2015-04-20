jack = Player.find_or_create_by!(name: 'jack')
jill = Player.find_or_create_by!(name: 'jill')
puts "Found or created players Jack and Jill"

10.times do
  if rand(2) == 1
    winner, loser = jack, jill
  else
    winner, loser = jill, jack
  end

  winner_score, loser_score = rand(250..300), rand(150..220)

  game = Game.create!(winner: winner, winner_score: winner_score, loser: loser, loser_score: loser_score, bingos: rand(2))
  puts "Created game ##{game.id}"
end
