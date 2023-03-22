module Users
  class FetchFromCache
    attr_reader :cache

    KEY_BASE = 'update_passwd_email_sent_to_'
    private_constant :KEY_BASE
    
    def initialize(cache: Rails.cache) 
      @cache = cache
    end

    def call(user_id)
      cache.fetch("#{KEY_BASE}#{user_id}", expires_in: 30.days) do
        SendUpdatePasswordEmailJob.new.perform(user_id)
      end
    end
  end
end
