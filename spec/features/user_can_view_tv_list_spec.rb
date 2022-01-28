feature 'List TV shows' do
  scenario 'user can view a list of TV shows' do
    connection = PG.connect(dbname: 'tv_manager_test')
    connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 1');")
    connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 2');")
    connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 3');")
    visit '/'
    click_link 'See TV shows'
    expect(page).to have_content('TV Shows')
    expect(page).to have_content('Test TV show 1')
    expect(page).to have_content('Test TV show 2')
    expect(page).to have_content('Test TV show 3')
  end
end
