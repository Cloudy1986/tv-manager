require 'pg'

class Show

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'tv_manager_test')
    else
      connection = PG.connect(dbname: 'tv_manager')
    end
    result = connection.exec("SELECT * FROM shows;")
    result.map { |show| show['title'] }
  end

end