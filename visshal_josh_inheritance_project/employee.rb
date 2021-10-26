class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

end

class Manager < Employee

    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        sum = @employees.inject(0) do |acc, employee|
            acc + employee.salary
        end

        sum * multiplier
    end

end

e1 = Employee.new("Shawna", "TA", 12000, "Darren")
e2 = Employee.new("David", "TA", 10000, "Darren")
m2 = Manager.new("Darren", "TA Manager", 78000, "Ned", [e1,e2])
m1 = Manager.new("Ned", "Founder", 1000000, nil, [m2,e1,e2])


p m1.bonus(5) # => 500_000
p m2.bonus(4) # => 88_000
p e2.bonus(3) # => 30_000