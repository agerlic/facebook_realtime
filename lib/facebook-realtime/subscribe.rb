module FacebookRealTime
  class Subscription
    # Subscription Verification
    # Before subscription addition/modification can complete, 
    # Facebook servers will make an HTTP GET to your callback URL with the following parameters:
    # 
    # hub.mode - The string subscribe is passed in this parameter
    # hub.challenge - A random string
    # hub.verify_token - The verify_token value you passed to Facebook
    # The end point should first verify the verify_token value is what you passed to Facebook, 
    # then return the hub.challenge value. 
    # This verification technique prevents malicious apps 
    # from using the real-time feature as tool for distributed denial-of-service (DDoS) attacks.
    def check
      hub_mode = params['hub.mode']
      hub_challenge = params['hub.challenge']
      hub_verify_token = params['hub.verify_token']
      res = ''
      if hub_mode == "subscribe" && hub_verify_token == FB['app_verify_token']
        res = hub_challenge
      end
      render :text => res
    end

    def add(object, fields, callback_url)
      add_url = "https://graph.facebook.com/#{FB['app_id']}"
      add_url << "/subscriptions?#{URI.escape(get_app_access_token)}"
      resp = RestClient.post add_url, :object => URI.escape(object),
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
      if @access_token == nil
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