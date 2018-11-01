class Role < ApplicationRecord
  has_many :users
  has_many :action_role_infos
  has_many :actions, through: :action_role_infos
end
