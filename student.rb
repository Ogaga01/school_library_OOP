class Student < Person
    def initialize(name = 'unknown', age, parent_permission = true, classroom)
        @name = name
        @age = age
        @parent_permission = parent_permission
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end
