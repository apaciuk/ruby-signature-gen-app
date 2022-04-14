require 'escher'
require 'rack'
  class Signature
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      signature = request.params['signature']
      return @app.call(env) unless signature

      begin
        Escher::Signature.verify(signature, request.params)
      rescue Escher::Signature::InvalidSignature
        return [403, {}, ['Invalid signature']]
      end

      @app.call(env)
    end
  end


