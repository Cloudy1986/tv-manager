require 'show'

describe Show do
  
  describe '.all' do
    it 'returns a list of the shows' do
      connection = PG.connect(dbname: 'tv_manager_test')
      connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 1');")
      connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 2');")
      connection.exec("INSERT INTO shows (title) VALUES ('Test TV show 3');")
      shows = Show.all
      expect(shows).to include('Test TV show 1')
      expect(shows).to include('Test TV show 2')
      expect(shows).to include('Test TV show 3')
    end
  end

end