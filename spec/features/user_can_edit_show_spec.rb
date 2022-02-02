feature 'Edit show' do
  scenario 'user can edit a show' do

    visit 'tv-show-list'
    click_link 'Add TV Show'
    fill_in 'title', with: 'Better Call Saul'
    click_button 'Submit'
    click_button 'Edit'
    fill_in 'title', with: 'Bosch'
    click_button 'Submit'
    
    expect(page).to have_content 'TV Shows'
    expect(page).not_to have_content 'Better Call Saul'
    expect(page).to have_content 'Bosch'
    
  end
end