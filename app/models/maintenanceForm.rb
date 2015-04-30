class MaintenanceForm < ActiveRecord::Base
	validates :issue_string, presence: true, length: { maximum: 1000 }
	
end
