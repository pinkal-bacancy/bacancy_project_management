# Mailer class for Employee module
class EmployeeMailer < ApplicationMailer
  def employee_send_password_email(employee)
    @employee = employee
    # password = SecureRandom.hex(6)
    # @delivery_boy.update_attribute(:password, "#{password}")
    mail(to: @employee&.email, subject: 'Registration Details')
  end
end
