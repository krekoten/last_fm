module Marjan
  module LastFm
    class Radio < Base
      create_api_method :get_playlist, :optional => [:discovery, :rtp, :bitrate, :buylinks, :speed_multiplier]
      create_api_method :tune, :required => [:station], :optional => [:lang], :method => :post
    end
  end
end