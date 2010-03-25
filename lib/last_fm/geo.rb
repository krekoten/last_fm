module Marjan
  module LastFm
    class Geo < Base
      create_api_method :get_events, :optional => [:location, :lat, :long, :page, :distance]
      # Country - ISO 3166-1
      create_api_method :get_metro_artist_chart, :required => [:country, :metro], :optional => [:start, :end]
      create_api_method :get_metro_hype_artist_chart, :required => [:country, :metro], :optional => [:start, :end]
      create_api_method :get_metro_track_chart, :required => [:country, :metro], :optional => [:start, :end]
      create_api_method :get_metro_hype_track_chart, :required => [:country, :metro], :optional => [:start, :end]
      create_api_method :get_metro_unique_artist_chart, :required => [:country, :metro], :optional => [:start, :end]
      create_api_method :get_metro_unique_track_chart, :required => [:country, :metro], :optional => [:start, :end]
      create_api_method :get_metro_weekly_chartlist
      create_api_method :get_top_artists, :required => [:country]
      create_api_method :get_top_tracks, :required => [:country], :optional => [:location]
    end
  end
end