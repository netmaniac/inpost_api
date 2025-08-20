module InpostApi
  class Error < StandardError; end
  class Connector
    def initialize(opts = {})
      raise InpostApi::Error.new("No ClientId, define it with :client_id option") if opts[:client_id].nil?
      @client_id = opts[:client_id]
      raise InpostApi::Error.new("No secret, define secret with :secret option") if opts[:secret].nil?
      @secret = opts[:secret]
      @mode = opts[:mode]
      @mode ||= :sandbox
      if @mode == :production
        @endpoint = 'https://api.inpost-group.com/'
      else
        @endpoint = 'https://sandbox-api.inpost-group.com//'
      end

    end
  end
end