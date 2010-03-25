module Marjan
  module LastFm
    class Group < Base
      create_api_method :get_members, :required => [:group]
      # user is actualy group title
      create_api_method :get_weekly_album_chart, :required => [:user], :optional => [:from, :to]
      create_api_method :get_weekly_artist_chart, :required => [:group], :optional => [:from, :to]
      create_api_method :get_weekly_chart_list, :required => [:group]
      create_api_method :get_weekly_track_chart, :required => [:group], :optional => [:from, :to]
    end
  end
end