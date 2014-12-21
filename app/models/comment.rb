class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :board

  validates :content, presence: true

  def self.save_inbound_mail!(event_payload)
    user = User.find_by!(email: event_payload.sender_email)
    board = Board.find_by!(token: event_payload.recipient_emails.first.split('@').first[/^.*\+(.*)$/, 1])
    board.comments.create!(user: user, content: event_payload.message_body(:text))
  end

end
