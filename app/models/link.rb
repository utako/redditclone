class Link < ActiveRecord::Base
  validates :title, :url, :body, presence: true

  belongs_to :sub
  belongs_to :submitter, class_name: "User", foreign_key: :submitter_id
  has_many :comments

  has_many :link_subs, foreign_key: :link_id, class_name: "LinkSub"

  has_many :subs, through: :link_subs, source: :sub

end
