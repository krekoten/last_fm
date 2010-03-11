module LastFm
  module Helper
    def self.included base
      base.extend ClassMethods
    end
    
    module ClassMethods
      def create_api_method method_name, params = {}
        self.class_eval %Q{
          def #{method_name.to_s} params = {}
            params.replace(params.inject({}) {|hash, (key, value)| hash[key.to_s] = value; hash})
            params.merge! {
              'api_key' => @api_key,
              'sk'      => session_key,
              'method'  => '#{self.class.to_s.split('::').last.downcase}.#{method_name.gsub(/_[a-z]/) {|s| s.upcase}.gsub(/_/, '')}'
            }
            
            params['api_sig'] = signature params
          end
        }
      end
    end
  end
end