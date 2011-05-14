module FacebookRealTime
    def self.add(object, fields, callback_url)
      add_url = "https://graph.facebook.com/#{FB['id']}"
      add_url << "/subscriptions?#{URI.escape(get_app_access_token)}"
      resp = RestClient.post add_url,
              :object => URI.escape(object),
              :fields => URI.escape(fields),
              :callback_url => URI.escape(callback_url),
              :verify_token => URI.escape(FB['verify_token'])
      puts resp
    end

    def self.delete
      delete_url = "https://graph.facebook.com/#{FB['id']}"
      delete_url << "/subscriptions?#{URI.escape(get_app_access_token)}"
      if object_name != nil
        delete_url << "&object=#{URI.escape(object_name)}"
      end
      resp = RestClient.delete delete_url
      puts resp
    end

    def self.list
      list_url = "https://graph.facebook.com/#{FB['id']}"
      list_url << "/subscriptions?#{URI.escape(get_app_access_token)}"
      list = RestClient.get list_url
      puts list
    end

    private
    def self.get_app_access_token
      if !FB['id']
        raise NotImplementedError.new("FB['id'] doesn't exist")
      end
      if !FB['secret']
         raise NotImplementedError.new("FB['NotImplementedError'] doesn't exist")
      end
      oauth_url = "https://graph.facebook.com/oauth/access_token"
      oauth_url << "?client_id=#{FB['id']}"
      oauth_url << "&client_secret=#{FB['secret']}"
      oauth_url << "&grant_type=client_credentials"
      access_token = RestClient.get oauth_url
  end
end