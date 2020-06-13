class ManagersController < ApplicationController
  def employees
    @employees_list = Employee.all
    @employees = user_employee(@employees_list)
  end

  private

  def user_employee(list)
    a = list.map { |x| User.find_by(profile: x) }
    a.select { |x| x }
  end
end
