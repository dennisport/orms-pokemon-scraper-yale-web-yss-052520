require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db
    @@all = []
    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name,type) VALUES (?, ?)", name,type)
    end

    def self.find(id, db)
        new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: new_pokemon[3])
    end
end

p1 = Pokemon.new(id:1, name:"Abra", type:"Pyshic", db:"db")
p2 = Pokemon.new(id:2, name:"Charmander", type:"Fire", db:"db")
0

