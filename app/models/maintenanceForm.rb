class MaintenanceForm < ActiveRecord::Base
	validates :issueString, presence: true, length: { maximum: 1000 }
	
end
