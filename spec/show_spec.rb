require 'show'

describe Show do
  
  describe '.all' do
    it 'returns a list of the shows' do
      connection = PG.connect(dbname: 'tv_manager_test')
      connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 1');")
      connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 2');")
      connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 3');")
      
      shows = Show.all

      expect(shows.length).to eq 3
      expect(shows[0]).to be_a Show
      expect(shows[0].title).to eq 'Test TV show 1'
      expect(shows[1].title).to eq 'Test TV show 2'
      expect(shows[2].title).to eq 'Test TV show 3'
    end
  end

  describe '.create' do
    it 'adds a show object to the database' do
      show = Show.create(title: 'Test TV show 4')

      connection = PG.connect(dbname: 'tv_manager_test')
      result = connection.exec("SELECT * FROM shows WHERE id = #{show.id};")

      expect(show).to be_a Show
      expect(show.id).to eq result[0]['id']
      expect(show.title).to eq result[0]['title']
    end
  end

  describe '.delete' do
    it 'deletes a show from the database' do
      show = Show.create(title: 'Test TV show 5')
      Show.delete(id: show.id)
      expect(Show.all.length).to eq 0
    end
  end

  describe '.find' do
    it 'returns the correct show from the database' do
      show = Show.create(title: 'Test TV Show 6')
      returned_show = Show.find(id: show.id)

      expect(returned_show).to be_a Show
      expect(returned_show.id).to eq show.id
      expect(returned_show.title).to eq show.title

    end
  end

  describe '.update' do
    it 'updates the show title in the database' do
      show = Show.create(title: 'Test TV Show 7')
      updated_show = Show.update(id: show.id, title: 'Test TV Show 8')

      expect(updated_show).to be_a Show
      expect(updated_show.id).to eq show.id
      expect(updated_show.title).to eq 'Test TV Show 8'
    end
  end

end
