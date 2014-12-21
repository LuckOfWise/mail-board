class Board < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def self.save_inbound_mail!(event_payload)
    user = User.find_by!(email: event_payload.sender_email)
    user.boards.create!(title: event_payload.subject, content: event_payload.message_body(:text))
  end
end
