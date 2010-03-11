module LastFm
  class Auth < LastFm::Base
    
    attr_accessor :api_key, :api_secret
    attr_writer   :session_key
    
    def initialize api_key, api_secret, session_key = nil
      @api_key = api_key
      @api_secret = api_secret
      @session_key = session_key
    end
    
    def authorize_url
      "http://www.last.fm/api/auth/?api_key=#{@api_key}"
    end
    
    def session_key key
      unless @session_key
      end
      @session_key
    end
  end
end