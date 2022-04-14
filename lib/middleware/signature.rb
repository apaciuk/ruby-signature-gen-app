require 'escher'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    signature = request.params['signature']
    if signature.nil?
      [400, {'Content-Type' => 'text/plain'}, ['Signature missing']]
    else
      if Escher.verify(signature, request.params)
        @app.call(env)
      else
        [400, {'Content-Type' => 'text/plain'}, ['Signature invalid']]
      end
    end
  end
end
