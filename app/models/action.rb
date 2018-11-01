class Action < ApplicationRecord
  has_many :action_role_infos
  has_many :roles, through: :action_role_infos
end
