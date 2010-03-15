require 'forwardable'
require 'digest'
require 'httparty'

module LastFm
  
  class Base
    
    extend Forwardable
    include Util
    include HTTParty
    
    base_uri 'http://ws.audioscrobbler.com/2.0/'
    
    class << self
      attr_accessor :user_agent
      @@user_agent = 'marjan_last_fm/' + LastFm::Version.string
    end
    
    def initialize auth = nil
      if auth
        @auth = auth
        self.class.default_params 'api_key' => api_key
        self.class.default_params 'format' => 'json'
        self.class.default_params 'sk' => session_key if session_key
      end
      self.class.headers 'User-Agent' => @@user_agent
    end
    
    def_delegators :@auth, :api_key, :api_secret, :session_key
    
    private
    def _signature params
      raise ArgumentError, "Params should be Hash" unless params.kind_of? Hash
      puts params.inspect
      Digest::MD5.hexdigest(params.sort.collect {|p| p.join}.join + api_secret)
    end
    
    def _test_for_error! data
      case data['error'].to_i
        when 2  then raise LastFm::InvalidServiceError, data['message']
        when 3  then raise LastFm::InvalidMethodError, data['message']
        when 4  then raise LastFm::AuthenticationFailedError, data['message']
        when 5  then raise LastFm::InvalidFormatError, data['message']
        when 6  then raise LastFm::InvalidParametersError, data['message']
        when 7  then raise LastFm::InvalidResourceError, data['message']
        when 9  then raise LastFm::InvalidSessionKeyError, data['message']
        when 10 then raise LastFm::InvalidApiKeyError, data['message']
        when 11 then raise LastFm::ServiceOfflineError, data['message']
        when 12 then raise LastFm::SubscriptionError, data['message']
        when 13 then raise LastFm::InvalidSignatureError, data['message']
        when 14 then raise LastFm::TokenNotAuthorizedError, data['message']
        when 18 then raise LastFm::NoFreeSubscriptionsError, data['message']
      end
    end
  end
end