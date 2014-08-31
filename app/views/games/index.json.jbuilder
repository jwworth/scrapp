json.array!(@games) do |game|
  json.extract! game, :id, :winner, :winner_score, :loser, :loser_score, :bingos
  json.url game_url(game, format: :json)
end
