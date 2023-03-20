# frozen_string_literal: true

class CreateNotificationJob < ApplicationJob
  queue_as :default

  def perform_async(user_id)
    user = User.find(user_id)

    UserMailer.with(user: user).welcome_email.deliver_later
  end
end

