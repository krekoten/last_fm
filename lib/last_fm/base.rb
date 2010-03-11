require "digest"

module LastFm
  class Base
    
    include Forwardable
    
    def initialize auth = nil
      @auth = auth if auth
    end
    
    def_delegators :@auth, :api_key, :api_secret, :session_key
    
    private
    def signature params
      raise "Params should be Hash" unless params.kind_of? Hash
      Digest::MD5.hexdigest api_secret + utf8_encode(params.sort.collect {|p| p.join}.join)
    end
    
    def utf8_encode string
      string.unpack("U*").map!{|i| "%u#{i.to_s(16)}"}.join
    end
  end
end