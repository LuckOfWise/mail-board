class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :board

  validates :content, presence: true

  def self.save_inbound_mail!(event_payload)
    board = Board.find_by!(token: event_payload.token)
    board.comments.create!(user: event_payload.user, content: event_payload.message_body(:text))
  end

end
