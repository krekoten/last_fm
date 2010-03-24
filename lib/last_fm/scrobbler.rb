module Marjan
  module LastFm
    class Scrobbler < Base
      
      def initialize auth, user_login
        super auth
        @timestamp = Time.now.to_i
        @user_login = user_login
        
        # Need to clear out default params setted in Base
      end
      
      @base_dir = File.join(File.dirname(__FILE__), 'scrobbler')

      autoload :Notification, File.join(@base_dir, 'notification')
      autoload :Submission, File.join(@base_dir, 'submission')
      
      class BannedError < StandardError; end                          # BANNED
      class BadAuthError < LastFm::AuthenticationFailedError; end     # BADAUTH
      class BadTimeError < StandardError; end                         # BADTIME
      class BadSessionError < LastFm::InvalidSessionKeyError; end     # BADSESSION
      class HardFailureError < LastFm::ServiceAccessError; end        # FAILED <reason>
      
      ProtcolVersion = '1.2.1'.freeze
      
      debug_output
      
      class << self
        attr_accessor :client_id
        attr_accessor :client_version
      end
      
      @@client_version ||= '1.0'
      @@client_id ||= 'tst'
      
      # Performs handshake with Last.fm's scrobbler API server
      def handshake!
        params = {
          :hs       => 'true',
          :p        => ProtcolVersion,
          :c        => @@client_id,
          :v        => @@client_version,
          :u        => @user_login,
          :t        => @timestamp,
          :a        => _token,
          :api_key  => api_key,
          :sk       => session_key
        }
        
        self.class.default_options[:default_params] = {}
        responce = self.class.get('http://post.audioscrobbler.com:80/', :query => params).split("\n")
        
        _test_for_error! responce[0]
        
        @session_id, @now_playing_url, @submission_url = responce[1..3]
      end
      
      # Posts now playing message to last.fm's API server
      def now_playing data
        data = data.to_param if data.kind_of? Notification
        raise ArgumentError, 'data should be Hash or Notification' unless data.kind_of?(Hash)
        
        responce = self.class.post(@now_playing_url, :query => data.merge(:s => @session_id)).split("\n")
        
        _test_for_error! responce[0]
      end
      
      def submit data
        data = [data] unless data.kind_of? Array
        params = {:s => @session_id}
        index = 0
        data.each do |info|
          info = info.to_param if info.kind_of? Submission
          raise ArgumentError, 'data should be Hash/Submission or array of Hash/Submission' unless info.kind_of? Hash
          info.each do |key, value|
            params["#{key}[#{index}]"] = value
          end
          index = index + 1
          break if index == 50 # No more than 50 tracks can be submitted at once
        end
        
        responce = self.class.post(@submission_url, :query => params).split("\n")
        
        _test_for_error! responce[0]
      end
      
      private
      def _token
        Digest::MD5.hexdigest(api_secret + @timestamp.to_s)
      end
      
      def _test_for_error! data
        case data
          when 'BANNED'           then raise BannedError, 'This client is banned!'
          when 'BADAUTH'          then raise BadAuthError, 'Wrong authentication data.'
          when 'BADTIME'          then raise BadTimeError, 'Wrong timestamp'
          when 'BADSESSION'       then raise BadSessionError, 'Session key is wrong'
          when /^FAILED\s+(.*?)/  then raise HardFailureError, "Hard failure: #{$1}"
        end
      end
      
    end
  end
end