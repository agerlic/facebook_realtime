class FacebookRealTime::SubscriptionsController < ApplicationController
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
  def facebook_check
    hub_mode = params['hub.mode']
    hub_challenge = params['hub.challenge']
    hub_verify_token = params['hub.verify_token']
    res = ''
    if !FB['verify_token']
        raise NotImplementedError.new("FB['verify_token'] doesn't exist")
      end
    if hub_mode == "subscribe" && hub_verify_token == FB['verify_token']
      res = hub_challenge
    end
    render :text => res
  end
  
  def facebook_update
    raise NotImplementedError.new("facebook realtime endpoint is not implemented.")
  end
end