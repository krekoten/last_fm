module Marjan
  module LastFm
    class Playlist < Base
      create_api_method :add_track, :required => [:playlistID, :track, :artist], :method => :post
      create_api_method :create, :optional => [:title, :description], :method => :post
      # FIXME: fetches XSPF. I think it should be parsed with different parser.
      create_api_method :fetch, :required => [:playlistURL]
    end
  end
end