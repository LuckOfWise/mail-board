class Board < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  before_create :generate_token
  def generate_token
    self.token = UUIDTools::UUID.random_create.to_s
  end

  def self.save_inbound_mail!(event_payload)
    event_payload.user.boards.create!(title: event_payload.subject, content: event_payload.message_body(:text))
  end
end
