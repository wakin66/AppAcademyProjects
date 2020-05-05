class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary)
        @name = name
        @title = title
        @salary = salary
        @boss = nil
    end

    def boss=(manager)
        return true if @boss == manager
        @boss = manager
        manager.add_employee(self)
        return true
    end

end