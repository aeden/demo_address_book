require_relative '../renderers/json_v1_renderer'
require_relative '../renderers/json_v2_renderer'

class ApplicationController < ActionController::Base
  protect_from_forgery
end
