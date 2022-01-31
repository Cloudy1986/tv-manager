feature 'Homepage' do
  scenario 'user can view the homepage' do
    visit "/"
    expect(page).to have_content("Welcome to TV Manager")
  end
end
