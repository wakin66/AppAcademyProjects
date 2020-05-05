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

    def bonus(multiplier)
        sum_employee_salary * multiplier
    end

    def sum_employee_salary
        sum = 0
        @employees.each do |employee|
            begin
                sum += (employee.salary + employee.sum_employee_salary)
            rescue NoMethodError
                sum += employee.salary
            end
        end
        return sum
    end

end