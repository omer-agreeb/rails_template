# frozen_string_literal: true

module Errors
  extend ::ActiveSupport::Concern

  included do
    # Handle Rails 404 error with custom method
    rescue_from ActiveRecord::RecordNotFound, with: :return_404_error

    # Handle Rails Bad Request error with custom method
    rescue_from ActionController::ParameterMissing, with: :return_400_error

    rescue_from AuthorizationError, with: :return_403_error

    # rescue_from Consul::Powerless, with: :return_403_error

    # Handle Foreign key voilation error with custom json response
    rescue_from ActiveRecord::InvalidForeignKey do
      render(
        json: {
          success: false,
          error: I18n.t('base.invalid_foreign_key'),
          status_code: 404
        },
        status: :not_found
      )
    end

    # Handle InterService Integration Errors
    rescue_from InterServiceError, with: :render_inter_service_error

    # Handle Validation Errors Gracefully
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error

    # Handle Bad Request Errors Gracefully
    rescue_from BadRequestError, with: :render_bad_request_error
  end

  class AuthorizationError < StandardError ;end
end
