module LastFm
  class User < LastFm::Base
    create_api_method :get_artist_tracks, :required => [:user, :artist], :optional => [:startTimespamp, :endTimestamp, :page]
    create_api_method :get_events, :required => [:user]
    create_api_method :get_friends, :required => [:user], :optional => [:recenttracks, :limit, :page]
    create_api_method :get_info
    create_api_method :get_loved_tracks, :required => [:user], :optional => [:limit, :page]
    create_api_method :get_neighbours, :required => [:user], :optional => [:limit]
    create_api_method :get_past_events, :required => [:user], :optional => [:page, :limit]
    create_api_method :get_playlists, :required => [:user]
    create_api_method :get_recent_stations, :required => [:user], :optional => [:page, :limit]
    create_api_method :get_recent_tracks, :required => [:user], :optional => [:page, :limit]
    create_api_method :get_recommended_artists
    create_api_method :get_recommended_events, :optional => [:page, :limit]
    create_api_method :get_shouts, :required => [:user]
    create_api_method :get_top_albums, :required => [:user], :optional => [:period]
    create_api_method :get_top_artists, :required => [:user], :optional => [:period]
    create_api_method :get_top_tags, :required => [:user], :optional => [:limit]
    create_api_method :get_top_tracks, :required => [:user], :optional => [:period]
    create_api_method :get_weekly_album_chart, :required => [:user], :optional => [:from, :to]
    create_api_method :get_weekly_artist_chart, :required => [:user], :optional => [:from, :to]
    create_api_method :get_weekly_chart_list, :required => [:user]
    create_api_method :get_weekly_track_chart, :required => [:user], :optional => [:from, :to]
    create_api_method :shout, :required => [:user, :message], :method => :post
  end
end