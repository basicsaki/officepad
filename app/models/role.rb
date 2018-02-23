class Role < ApplicationRecord

    has_many :user_roles,class_name: "UserRole"
	has_many :users,through: :user_roles

end
