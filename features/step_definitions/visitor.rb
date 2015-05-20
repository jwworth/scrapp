Given 'I visit the homepage' do
  visit root_path
end

And 'two players exist' do
  FactoryGirl.create_list(:player, 2)
end

When(/^I click "(.*?)"$/) do |arg|
  click_on arg
end

When 'I fill in the form' do
  select(Player.first.name, from: 'game[winner_id]')
  fill_in 'Winner Score', with: '100'
  select(Player.last.name, from: 'game[loser_id]')
  fill_in 'Loser Score', with: '80'
end

When 'I fill in the form with invalid data' do
  # noop
end

Then 'I should see my game' do
  expect(page).to have_content 'Game was successfully created'
  expect(page).to have_content 'User1'
  expect(page).to have_content 'Winner Score: 100'
  expect(page).to have_content 'User2'
  expect(page).to have_content 'Loser Score: 80'
end

Then 'I should see the new game page' do
  within 'article' do
    expect(page).to have_content 'New Game'
  end
end

Then 'I should see a link to the source code' do
  within 'footer' do
    expect(page).to have_link 'Source', href: 'http://github.com/jwworth/scrapp'
  end
end

Then 'I should see the copyright information' do
  within 'footer' do
    expect(page).to have_content "© #{Date.today.year}"
    expect(page).to have_link 'Jake Worth', href: 'http://worth-chicago.co'
  end
end

Given 'a game exists' do
  winner = FactoryGirl.create(:player)
  loser = FactoryGirl.create(:player)

  @game = FactoryGirl.create(:game, winner: winner, winner_score: 200, loser: loser, loser_score: 100)
end

Given 'no games exist' do
  # noop
end

Then 'I should see the game' do
  within 'tbody tr' do
    expect(page).to have_content @game.winner_name
    expect(page).to have_content @game.loser_name
  end
end

When 'I click on show' do
  within 'tbody tr' do
    click_on 'Show'
  end
end

Then 'I see the page for that game' do
  expect(page).to have_content @game.id
  expect(page).to have_content @game.winner_name
  expect(page).to have_content @game.loser_name
  expect(page).to have_content @game.winner_score
  expect(page).to have_content @game.loser_score
  expect(page).to have_content @game.bingos
end

Then(/^I should see the message "(.*?)"$/) do |msg|
  expect(page).to have_content(msg)
end
