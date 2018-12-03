class Commentary < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commentary

  def accept!
    update_attributes(is_accepted: true)
  end

  def delete!
    update_attributes(is_deleted: true)
  end
end
