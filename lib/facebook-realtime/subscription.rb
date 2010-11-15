module FacebookRealTime
  class Subscription
    def add(object, fields, callback_url)
      add_url = "https://graph.facebook.com/#{FB['app_id']}"
      add_url << "/subscriptions?#{URI.escape(get_app_access_token)}"
      resp = RestClient.post add_url,
              :object => URI.escape(object),
              :fields => URI.escape(fields),
              :callback_url => URI.escape(callback_url),
              :verify_token => URI.escape(FB['app_verify_token'])
      puts resp
    end

    def delete
      delete_url = "https://graph.facebook.com/#{FB['app_id']}"
      delete_url << "/subscriptions?#{URI.escape(get_app_access_token)}"
      if object_name != nil
        delete_url << "&object=#{URI.escape(object_name)}"
      end
      resp = RestClient.delete delete_url
      puts resp
    end

    def list
      list_url = "https://graph.facebook.com/#{FB['app_id']}"
      list_url << "/subscriptions?#{URI.escape(get_app_access_token)}"
      list = RestClient.get list_url
      puts list
    end

    private
    def get_app_access_token
      if @access_token
        oauth_url = "https://graph.facebook.com/oauth/access_token"
        oauth_url << "?client_id=#{FB['app_id']}"
        oauth_url << "&client_secret=#{FB['app_secret']}"
        oauth_url << "&grant_type=client_credentials"
        access_token = RestClient.get oauth_url
        @access_token = access_token
      end
      return @access_token
    end
  end
end