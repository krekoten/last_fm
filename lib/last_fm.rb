require 'rubygems'

module Marjan
  module LastFm
  
    class InvalidServiceError < StandardError; end        # 2
    class InvalidMethodError < StandardError; end         # 3
    class AuthenticationFailedError < StandardError; end  # 4
    class InvalidFormatError < StandardError; end         # 5
    class InvalidParametersError < StandardError; end     # 6
    class InvalidResourceError < StandardError; end       # 7
    class OperationFailedError < StandardError; end       # 8
    class InvalidSessionKeyError < StandardError; end     # 9
    class InvalidApiKeyError < StandardError; end         # 10
    class ServiceOfflineError < StandardError; end        # 11
    class SubscriptionError < StandardError; end          # 12
    class InvalidSignatureError < StandardError; end      # 13
    class TokenNotAuthorizedError < StandardError; end    # 14
    class NoFreeSubscriptionsError < StandardError; end   # 18
    class ServiceAccessError < StandardError; end
  
    @base_dir = File.join(File.dirname(__FILE__), 'last_fm')
  
    autoload :Util,         File.join(@base_dir, 'util')
    
    autoload :Auth,         File.join(@base_dir, 'auth')
    autoload :Album,        File.join(@base_dir, 'album')
    autoload :Base,         File.join(@base_dir, 'base')
    autoload :Event,        File.join(@base_dir, 'event')
    autoload :Geo,          File.join(@base_dir, 'geo')
    autoload :Group,        File.join(@base_dir, 'group')
    autoload :Library,      File.join(@base_dir, 'library')
    autoload :Playlist,     File.join(@base_dir, 'playlist')
    autoload :Radio,        File.join(@base_dir, 'radio')
    autoload :Scrobbler,    File.join(@base_dir, 'scrobbler')
    autoload :Tag,          File.join(@base_dir, 'tag')
    autoload :Tasteometer,  File.join(@base_dir, 'tasteometer')
    autoload :Track,        File.join(@base_dir, 'track')
    autoload :User,         File.join(@base_dir, 'user')
    autoload :Venue,        File.join(@base_dir, 'venue')
  end
end