module LastFm
  class Venue < LastFm::Base
    create_api_method :get_events, :required => [:venue]
    create_api_method :get_past_events, :required => [:venue], :optional => [:page, :limit]
    create_api_method :search, :required => [:venue], :optional => [:page, :limit, :country]
  end
end