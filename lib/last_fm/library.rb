module Marjan
  module LastFm
    class Library < Base
      create_api_method :add_album, :required => [:artist, :album], :method => :post
      create_api_method :add_album, :required => [:artist], :method => :post
      create_api_method :add_track, :required => [:artist, :track], :method => :post
      create_api_method :get_albums, :required => [:user], :optional => [:artist, :limit, :page]
      create_api_method :get_artists, :required => [:user], :optional => [:limit, :page]
      create_api_method :get_tracks, :required => [:user], :optional => [:artist, :album, :limit, :page]
    end
  end
end