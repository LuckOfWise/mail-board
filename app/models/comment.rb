class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :board

  validates :content, presence: true
end
