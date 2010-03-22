module Marjan
  module LastFm
    class Tasteometer < Base
      create_api_method :compare, :required => [:type1, :type2, :value1, :value2], :optional => [:limit]
    end
  end
end