class User < ApplicationRecord
	enum status: { active: "active", deleted: "deleted", inactive: "inactive" }
	enum role: { candidate: "candidate", employer: "employer" }
	scope :working, -> { where(name: '55') }


	validates_presence_of :name
end
