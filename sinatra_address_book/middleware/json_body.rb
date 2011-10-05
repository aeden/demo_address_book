class JsonBody
  CONTENT_TYPE = 'CONTENT_TYPE'.freeze
  POST_BODY = 'rack.input'.freeze
  FORM_INPUT = 'rack.request.form_input'.freeze
  FORM_HASH = 'rack.request.form_hash'.freeze

  # Supported Content-Types
  APPLICATION_JSON = 'application/json'.freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    if Rack::Request.new(env).media_type == APPLICATION_JSON && (body = env[POST_BODY].read).length != 0
      env.update(FORM_HASH => JSON.parse(body), FORM_INPUT => env[POST_BODY])
    end
    @app.call(env)
  end
end
