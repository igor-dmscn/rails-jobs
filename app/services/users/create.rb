# frozen_string_literal: true

module Users
  class Create
    class << self
      def call(params)
        user = User.find_by(email: params[:email])

        if user.nil?
          user = User.create!(
            email: params[:email],
            name: params[:name],
            login: params[:login]
          )

          CreateNotificationWorker.perform_async(user.id)
        end

        user
      end
    end
  end
end
