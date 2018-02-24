class Comment < ApplicationRecord

	belongs_to :suggestion
	belongs_to :owner,class_name: "User",foreign_key: "comment_by"
	validates :text,:presence=>true

end
