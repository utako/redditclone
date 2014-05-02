class Sub < ActiveRecord::Base
  validates :name, presence: true#, uniqueness: true
  validates :moderator, presence: true

  belongs_to :moderator, class_name: "User", foreign_key: :user_id

  has_many :link_subs, class_name: "LinkSub"

  has_many :links, through: :link_subs, source: :link


end
