class Suggestion < ApplicationRecord

	belongs_to :owner,foreign_key: "user_id",class_name: "User"
	has_many :comments

end
