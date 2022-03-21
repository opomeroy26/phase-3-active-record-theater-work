class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
        # self.auditions.pluck(:actor)
        # self.audtions.map(&:actor)
        self.auditions.map{|audition| audition.actor}

    end

    def locations 
        self.auditions.pluck(:location)
        #auditions.pluc(:location) #Ruby will suplly implicit self
    end

    def lead
        # lead = self.auditions.find{|audition| audition.hired} #AR method and Ruby method
        lead = self.auditions.find_by(hired: true) #all AR methods
        lead ? lead : "No actor has been hired for this role"
    end

    def understudy
        # hireds = self.auditions.filter{|aud| aud.hired} 
        #understudy = hireds[1] # Ruby method
        understudy = self.auditions.where(hired: true).second
        understudy ? understudy : "No actor has been hired for understudy for this role"
    end

end 