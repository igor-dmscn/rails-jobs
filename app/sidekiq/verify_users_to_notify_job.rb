class VerifyUsersToNotifyJob
  include Sidekiq::Job

  def perform(*args)
    pp 'Verifying'
  end
end
