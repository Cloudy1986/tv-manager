require 'pg'

class Show

  attr_reader :id, :title

  def initialize(id:, title:)
    @id = id
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'tv_manager_test')
    else
      connection = PG.connect(dbname: 'tv_manager')
    end
    result = connection.exec("SELECT * FROM shows;")
    result.map do |show|
      Show.new(id: show['id'], title: show['title'])
    end
  end

  def self.create(title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'tv_manager_test')
    else
      connection = PG.connect(dbname: 'tv_manager')
    end
    result = connection.exec_params("INSERT INTO shows (title) VALUES ($1) RETURNING id, title;", [title])
    Show.new(id: result[0]['id'] , title: result[0]['title'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'tv_manager_test')
    else
      connection = PG.connect(dbname: 'tv_manager')
    end
    result = connection.exec_params("DELETE FROM shows WHERE id = $1;", [id])
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'tv_manager_test')
    else
      connection = PG.connect(dbname: 'tv_manager')
    end
    result = connection.exec_params("SELECT * FROM shows where id = $1;", [id])
    Show.new(id: result[0]['id'], title: result[0]['title'])
  end

end