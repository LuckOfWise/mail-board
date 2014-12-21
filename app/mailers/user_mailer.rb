class UserMailer < ActionMailer::Base
  default from: 'no-reply@' + Rails.application.secrets.mail_domain_name

  def comment_created(comment)
    @comment = comment
    mail to: comment.board.user.email, subject: '新しいコメントがつきました',
         reply_to: "comment+#{comment.board.token}@#{Rails.application.secrets.mail_domain_name}"
  end
end
