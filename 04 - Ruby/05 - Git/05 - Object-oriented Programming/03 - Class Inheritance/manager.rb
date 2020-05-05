require_relative 'employee.rb'

class Manager < Employee

    def initialize(name,title,salary)
        super
        @employees = Array.new
    end

    def add_employee(employee)
        return true if @employees.include?(employee)
        @employees << employee
        employee.boss = self
        return true
    end

    def delete_employee(employee)
        return true if !@employees.include?(employee)
        @employees.delete(employee)
        employee.boss = nil
        return true
    end 

end