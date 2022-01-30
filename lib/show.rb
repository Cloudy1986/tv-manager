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

end