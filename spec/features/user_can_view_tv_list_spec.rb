feature 'List TV shows' do
  scenario 'user can view a list of TV shows' do
    visit '/'
    click_link 'See TV shows'
    expect(page).to have_content('TV Shows')
    expect(page).to have_content('The Wire')
    expect(page).to have_content('The Sopranos')
    expect(page).to have_content('Fargo')
  end
end
