require 'dm-rails/middleware/identity_map'
class ApplicationController < ActionController::Base
  use Rails::DataMapper::Middleware::IdentityMap
  protect_from_forgery

  before_filter :set_context


private

  def set_context
    @posttimecompare = (Time.now.to_f).to_i - (session[:time_post]).to_i
  end

end
