Given 'I visit the homepage' do
  visit root_path
end

Given 'a game exists' do
  winner = FactoryGirl.create(:player)
  loser = FactoryGirl.create(:player)

  FactoryGirl.create(:game, winner: winner, winner_score: 200, loser: loser, loser_score: 100)
end

Given 'no games exist' do
  # noop
end

Then 'I should see the game' do
  within 'tbody tr' do
    expect(page).to have_content('User1')
    expect(page).to have_content('User2')
  end
end

Then(/^I should see the message "(.*?)"$/) do |msg|
  expect(page).to have_content(msg)
end
