class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ResponseRenderer
  include ActionController::Helpers
  include Errors
  include ErrorHandlers

  before_action :cors_set_access_control_headers
  around_action :switch_locale

  def server_status
    render json: {
      success: true,
      message: 'API Server is up',
      env: Rails.env
    }
  end

  private

  # This method will set the access control header accordingly after each action performed.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Access-Token, locale, authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def switch_locale(&action)
    parsed_locale = params[:locale] || request.headers['locale'] || I18n.default_locale
    locale = I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
