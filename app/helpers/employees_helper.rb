module EmployeesHelper
  def hour_has_employee?(service_hour)
    service_hour.employee.nil? ? 'red' : 'green'
  end
end
