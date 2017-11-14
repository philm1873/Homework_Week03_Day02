require('pg')

class Bounty

attr_accessor :name, :species, :bounty, :danger_level

  def initialize(input)
    @id = input['id'] if input['id']
    @name = input['name']
    @species = input['species']
    @bounty = input['bounty'].to_i
    @danger_level = input['danger_level']
  end

  def save
    db = PG.connect( {dbname: 'bounty_tracker', host: 'localhost'} )
    sql = "INSERT INTO bounties (name, species, bounty, danger_level)
           VALUES ($1, $2, $3, $4)
           RETURNING *"
    values = [@name, @species, @bounty, @danger_level]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close
  end

  def update
    db = PG.connect( {dbname: 'bounty_tracker', host: 'localhost'} )
    sql = "UPDATE bounties
    SET (name, species, bounty, danger_level) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @species, @bounty, @danger_level, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close
  end

  def delete
    db = PG.connect( {dbname: 'bounty_tracker', host: 'localhost'} )
    sql = "DELETE FROM bounties WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close
  end

  def self.find(id)
    db = PG.connect( {dbname: 'bounty_tracker', host: 'localhost'} )
    sql = "SELECT * FROM bounties WHERE id = $1"
    values = [id]
    db.prepare("find", sql)
    bounty = db.exec_prepared("find", values)
    db.close
    return Bounty.new(bounty[0])
  end

end
