module LastFm
  module Util
    def self.included base
      base.extend ClassMethods
    end
    
    module ClassMethods
      def create_api_method method_name, params = {}
        
        method_type = params[:method] || :get
        
        allowed = [:get, :post]
        
        raise ArgumentError, "Allowed methods: #{allowed.join(', ')}." unless allowed.include? method_type
        
        method_code = %Q{
          def #{method_name.to_s} params = {}
            
            raise ArgumentError, 'Parameters should be Hash' unless params.kind_of? Hash
            
            #{params[:required].to_a.inspect}.each do |param|
              raise ArgumentError, "Required parameters for #{method_name.to_s}: #{params[:required].to_a.join(', ')}." unless params.keys.include? param
            end unless #{params[:required].to_a.inspect}.empty?
            
            params.keys.each do |param|
              unless #{params[:required].to_a.inspect}.include?(param) || #{params[:optional].to_a.inspect}.include?(param)
                raise \\
                  ArgumentError, \\
                  "Unknown param: \#\{param\}. Required: #{params[:required].to_a.join(', ')}. Optional: #{params[:optional].to_a.join(', ')}."
              end
            end unless params.empty?
            
            params.replace(params.inject({}) {|hash, (key, value)| hash[key.to_s] = value; hash})
            params['method'] = '#{self.to_s.split('::').last.downcase}.#{method_name.to_s.gsub(/_[a-z]/) {|s| s.upcase}.gsub(/_/, '')}'
            
            _params_for_signature = params.merge(self.class.default_params)
            _params_for_signature.delete('format')
            
            params['api_sig'] = _signature(_params_for_signature)
            
            result = self.class.#{method_type.to_s}('', :query => params)
            _test_for_error! result
            result
          end
        }
        
        self.class_eval method_code
      end
    end
  end
end