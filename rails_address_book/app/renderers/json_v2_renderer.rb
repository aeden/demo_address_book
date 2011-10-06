ActionController::Renderers.add :json_v2 do |resource, options|
  self.content_type = Mime::JSON_V2
  self.response_body = resource.to_json_v2(options)
end

