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

end
