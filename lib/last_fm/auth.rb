module LastFm
  class Auth < LastFm::Base
    
    attr_accessor :api_key, :api_secret, :session_key
    
    def initialize api_key, api_secret, session_key = nil
      @api_key = api_key
      @api_secret = api_secret
      @session_key = session_key
      super self
    end
    
    def authorize_url
      "http://www.last.fm/api/auth/?api_key=#{@api_key}"
    end
    
    create_api_method :get_session, :required => [:token]
  end
end