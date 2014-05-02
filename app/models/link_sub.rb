class LinkSub < ActiveRecord::Base
  validates :link_id, :sub_id, presence: true

  belongs_to :link, foreign_key: :link_id, class_name: "Link"

  belongs_to :sub, foreign_key: :sub_id, class_name: "Sub"



end
