class Teacher < Person
    def initialize(name = 'unknown', age, parent_permission = true, specialization)
        @name = name
        @age = age
        @parent_permission = parent_permission
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end