class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select{|appointment| appointment.doctor == self}
    end

    def patients
        Appointment.all.collect{|appointment| appointment.patient if appointment.doctor == self}.compact
    end

    def self.all
        @@all
    end
end

