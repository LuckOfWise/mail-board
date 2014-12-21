class Inbox::BoardsController < ApplicationController
  include Mandrill::Rails::WebHookProcessor

  skip_before_action :authenticate_user!

  def handle_inbound(event_payload)
    Board.save_inbound_mail!(event_payload)
  end
end
