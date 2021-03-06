# == Schema Information
#
# Table name: employeefamilies
#
#  EmployeeID    :string(6)        default(""), not null, primary key
#  MaritalStatus :string(10)       default(""), not null
#  NoOfChildren  :integer          not null
#

class Employee::Employeefamily < ActiveRecord::Base
	belongs_to :employee, class_name: "Employee::Employeepersonaldetail", foreign_key: :EmployeeID, :dependent => :delete

	after_initialize :default_values

	private

	def default_values
		self.MaritalStatus = "Single" if self.MaritalStatus.blank?
    self.NoOfChildren ||= "0"
  end
end
