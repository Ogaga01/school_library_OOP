class Person
    def initialize(name = 'unknown', age, parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def id
        @id
    end

    def name
        @name
    end

    def name(value)
        @name = value
    end

    def age
        @age
    end

    def age(value)
        @age = value
    end

    def can_use_services?
        is_of_age? || parent_permission
    end

    private

    def is_of_age
        if @age >= 18
        true
        else false
        end
    end
end