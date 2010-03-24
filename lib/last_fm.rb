require 'rubygems'

module Marjan
  module LastFm
  
    class InvalidServiceError < StandardError; end        # 2
    class InvalidMethodError < StandardError; end         # 3
    class AuthenticationFailedError < StandardError; end  # 4
    class InvalidFormatError < StandardError; end         # 5
    class InvalidParametersError < StandardError; end     # 6
    class InvalidResourceError < StandardError; end       # 7
    class InvalidSessionKeyError < StandardError; end     # 9
    class InvalidApiKeyError < StandardError; end         # 10
    class ServiceOfflineError < StandardError; end        # 11
    class SubscriptionError < StandardError; end          # 12
    class InvalidSignatureError < StandardError; end      # 13
    class TokenNotAuthorizedError < StandardError; end    # 14
    class NoFreeSubscriptionsError < StandardError; end   # 18
    class ServiceAccessError < StandardError; end
  
    @base_dir = File.join(File.dirname(__FILE__), 'last_fm')
  
    autoload :Base, File.join(@base_dir, 'base')
    autoload :Util, File.join(@base_dir, 'util')
    autoload :Auth, File.join(@base_dir, 'auth')
    autoload :Scrobbler, File.join(@base_dir, 'scrobbler')
    autoload :Tasteometer, File.join(@base_dir, 'tasteometer')
    autoload :Track, File.join(@base_dir, 'track')
    autoload :User, File.join(@base_dir, 'user')
    autoload :Version, File.join(@base_dir, 'version')
    autoload :Venue, File.join(@base_dir, 'venue')
  end
end