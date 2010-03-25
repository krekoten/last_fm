module Marjan
  module LastFm
    class Album < Base
      # tags (Required) : A comma delimited list of user supplied tags to apply to this album. Accepts a maximum of 10 tags.
      create_api_method :add_tags, :required => [:artist, :album, :tags], :method => :post
      create_api_method :get_buylinks, :optional => [:artist, :album, :mbid, :country]
      # ang (Optional) : The language to return the biography in, expressed as an ISO 639 alpha-2 code.
      create_api_method :get_info, :optional => [:artist, :album, :mbid, :username, :lang]
      create_api_method :get_tags, :required => [:artist, :album]
      create_api_method :remove_tag, :required => [:artist, :album, :tag], :method => :post
      create_api_method :search, :required => [:album], :optional => [:limit, :page]
    end
  end
end