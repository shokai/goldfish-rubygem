require 'net/http'
require 'uri'

module GoldFish
  class Poi

    class Error < StandardError
    end
    
    attr_reader :api
    
    def initialize(api='http://ubif.org:8932')
      api = api.to_s unless api.class != String
      api.gsub!(/\/$/,'')
      raise Error.new "#{api} is Invalid URI" unless api =~ /^https?:\/\/.+/
        @api = api
    end
    
    def get(tag, &block)
      uri = URI.parse "#{@api}/#{tag}"
      loop do
        begin
          res = Net::HTTP.start(uri.host, uri.port).get(uri.path)
        rescue StandardError, Timeout::Error
          sleep 1
          next
        end
        if res.code.to_i == 200
          yield res if block_given?
          return res.body
        end
        sleep 1
      end
    end
    
    def post(tag, data)
      uri = URI.parse "#{@api}/to_#{tag}"
      begin
        res = Net::HTTP.start(uri.host, uri.port).post(uri.path, data)
      rescue StandardError, Timeout::Error => e
        raise Error.new e.to_s
      end
      res
    end
    
  end
end
