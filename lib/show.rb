require 'pg'

class Show

  def self.all
    connection = PG.connect(dbname: 'tv_manager')
    result = connection.exec("SELECT * FROM shows;")
    result.map { |show| show['title'] }
  end

end