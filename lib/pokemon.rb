class Pokemon
    require "pry"
    attr_accessor :id, :name, :type, :db

    @@all = []

    def initialize(id:, name:, type:, db:)
        #attributes.each {|key, value| self.send(("#{key}="), value)}
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
      #binding.pry
    
    
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
    #binding.pry

    end

    def self.find(id, db)
      
      result = db.execute("SELECT * FROM pokemon WHERE id = ?", [id])
      pokemon_info = result[0]
      
      Pokemon.new(id: pokemon_info[0],name: pokemon_info[1],type: pokemon_info[2],db: db)
  
    end
end
