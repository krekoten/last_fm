module Marjan
  module LastFm
    class Tag < Base
      create_api_method :get_similar, :required => [:tag]
      create_api_method :get_top_albums, :required => [:tag]
      create_api_method :get_top_artists, :required => [:tag]
      create_api_method :get_top_tags
      create_api_method :get_top_tracks, :required => [:tag]
      create_api_method :get_weekly_artist_chart, :required => [:tag], :optional => [:from, :to, :limit]
      create_api_method :get_weekly_chart_list, :required => [:tag]
      create_api_method :search, :required => [:tag], :optional => [:page, :limit]
    end
  end
end