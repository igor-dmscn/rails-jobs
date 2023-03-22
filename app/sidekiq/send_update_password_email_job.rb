class SendUpdatePasswordEmailJob
  include Sidekiq::Job

  def perform(user_id)
    user = User.find(user_id)

    UserMailer.with(user: user).update_password.deliver_now
  end
end
