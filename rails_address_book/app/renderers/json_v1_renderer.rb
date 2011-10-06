ActionController::Renderers.add :json_v1 do |resource, options|
  self.content_type = Mime::JSON_V1
  self.response_body = resource.to_json_v1(options)
end
