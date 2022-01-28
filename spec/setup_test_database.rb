require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'tv_manager_test')
  p "Setting up test database"
  connection.exec("TRUNCATE shows;")
end
