feature 'Add Shows' do
  scenario 'user can add a show and it displays in the TV shows list' do
    visit '/'
    click_link 'See TV shows'
    click_link 'Add TV Show'
    fill_in 'title', with: 'Ozark'
    click_button 'Submit'
    expect(page).to have_content('Ozark')
  end
end
