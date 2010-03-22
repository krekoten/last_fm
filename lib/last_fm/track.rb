module Marjan
  module LastFm
    class Track < Base
      create_api_method :add_tags, :required => [:artist, :track, :tags], :method => :post
      create_api_method :ban, :required => [:track, :artist], :method => :post
      # required artist and track or mbid
      create_api_method :get_buylinks, :optional => [:artist, :track, :mbid, :country]
      # required artist and track or mbid
      create_api_method :get_info, :optional => [:artist, :track, :mbid, :username]
      # required artist and track or mbid
      create_api_method :get_similar, :optional => [:artist, :track, :mbid]
      create_api_method :get_tags, :required => [:artist, :track]
      create_api_method :get_top_fans, :optional => [:artist, :track, :mbid]
      create_api_method :get_top_tags, :optional => [:artist, :track, :mbid]
      create_api_method :love, :required => [:track, :artist], :method => :post
      create_api_method :remove_tag, :required => [:artist, :track, :tag], :method => :post
      create_api_method :search, :required => [:track], :optional => [:limit, :page, :artist]
      create_api_method :share, :required => [:artist, :recipient, :track], :optional => [:message], :method => :post
    end
  end
end