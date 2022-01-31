feature 'Delete Show' do
  scenario 'user can delete a show' do
    visit '/'
    click_link 'See TV shows'
    click_link 'Add TV Show'
    fill_in 'title', with: 'The Bridge'
    click_button 'Submit'
    click_button 'Delete'
    expect(page).not_to have_content('The Bridge')
  end
end
