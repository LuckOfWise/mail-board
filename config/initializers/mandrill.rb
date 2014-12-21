class Mandrill::WebHook::EventDecorator

  def user
    User.find_by(email: sender_email)
  end

  def token
    recipient_emails.first.split('@').first[/^.*\+(.*)$/, 1]
  end

end
