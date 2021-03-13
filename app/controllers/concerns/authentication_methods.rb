# frozen_string_literal: true

module AuthenticationMethods
  extend ::ActiveSupport::Concern

  included do
    before_action :login_required
    prepend_before_action :set_current_user

    attr_reader :current_user
  end

  private

  def login_required
    if token.present?
      if api_token&.user && api_token.user.active?
        session[:token] = token
      else
        render_unauthorized(
          message: I18n.t('base.not_authenticated')
        )
      end
    else
      render_unauthorized(
        message: I18n.t('base.login_required')
      )
    end
  end

  def set_current_user
    @current_user = api_token.user if token.present? && api_token&.user && api_token.user.active?
  end

  def token
    @token ||= \
      params[:access_token] || request.headers['Access-Token']
  end

  def api_token
    @api_token ||= Token.find_by(access_token: token)
  end
end
