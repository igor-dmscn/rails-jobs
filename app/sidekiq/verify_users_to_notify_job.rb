class VerifyUsersToNotifyJob
  include Sidekiq::Job

  def perform
    users = User.all

    users.each do |user|
      Users::FetchFromCache.new.call(user.id)
    end
  end
end
