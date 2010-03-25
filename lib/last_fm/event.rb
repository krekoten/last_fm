module Marjan
  module LastFm
    class Event < Base
      # Status: 0=Attending, 1=Maybe attending, 2=Not attending
      create_api_method :attend, :required => [:event, :status], :method => :post
      create_api_method :get_attendees, :required => [:event]
      create_api_method :get_info, :required => [:event]
      create_api_method :get_shouts, :required => [:event]
      
      # Recipient (Required): Email Address | Last.fm Username - A comma delimited list of email addresses or Last.fm usernames. Maximum is 10.
      create_api_method :share, :required => [:event, :recipient], :optional => [:message], :method => :post
      create_api_method :shout, :required => [:event, :message], :method => :post
    end
  end
end