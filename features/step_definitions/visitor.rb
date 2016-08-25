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
  fill_in 'Winner Score', with: nil
end

Then 'I should see my new game' do
  expect(page).to have_content("Game was successfully created")
  expect(page).to have_content Game.last.id
end

Then 'I should see my edited game' do
  expect(page).to have_content("Game was successfully updated")
  expect(page).to have_content @game.id
end

Then 'I should see the new game page' do
  within 'article' do
    expect(page).to have_content 'New Game'
  end
end

Then 'I should see the edit game page' do
  within 'article' do
    expect(page).to have_content 'Edit Game'
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
    expect(page).to have_link 'Jake Worth', href: 'http://jakeworth.com'
  end
end

Given 'a game exists' do
  @game = FactoryGirl.create(:game)
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
