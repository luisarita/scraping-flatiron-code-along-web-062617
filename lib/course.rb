class Course
    attr_accessor :title, :schedule, :description
    @@all = []

    def initialize
        @@all << self
    end

    #def schedule
    #end
    #def description
    #end

    def self.reset_all
        @@all = []
    end
    def self.all
        @@all
    end
   
end


