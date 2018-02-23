class Answer < ApplicationRecord

	belongs_to :question
	belongs_to :owner,class_name: "User",foreign_key: "answered_by"

	validates :text,:presence=>true

end
