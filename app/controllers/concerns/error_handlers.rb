# frozen_string_literal: true

module ErrorHandlers
  extend ::ActiveSupport::Concern

  # This method will return JSON error message with 404 status code when rails app
  # throw not found error.
  def return_404_error
    render(
      json: {
        success: false,
        error: I18n.t('errors.e_404'),
        status_code: 404
      },
      status: :not_found
    )
  end

  def return_403_error
    render(
      json: {
        success: false,
        error: I18n.t('errors.e_403'),
        status_code: 403
      },
      status: 403
    )
  end

  # This method will return JSON error message with 400 status code when rails app
  # throw bad request error.
  def return_400_error
    render(
      json: {
        success: false,
        error: I18n.t('errors.e_400'),
        status_code: 400
      },
      status: 400
    )
  end

  # This method will return JSON error message with 400 status code when rails app
  # throw range error.
  def return_range_error
    render(
      json: {
        success: false,
        error: I18n.t('errors.e_range_error'),
        status_code: 400
      },
      status: 400
    )
  end

  def unknown_file_format_error
    render(
      json: {
        success: false,
        error: I18n.t('bulk_import.unknown_file_type'),
        status_code: 422
      },
      status: 422
    )
  end

  def render_mudad_error(err)
    render(
      json: {
        success: false,
        error: err.message,
        status_code: 400
      },
      status: :bad_request
    )
  end

  def render_inter_service_error(err)
    render(
      json: {
        success: false,
        error: err.error_message,
        status_code: err.status_code
      },
      status: err.status_code
    )
  end

  def render_validation_error(err)
    render(
      json: {
        success: false,
        error: err.record.errors.full_messages.join(', '),
        status_code: 422
      },
      status: 422
    )
  end

  def render_bad_request_error(err)
    render(
      json: {
        success: false,
        error: err.message,
        status_code: 400
      },
      status: 400
    )
  end

  def render_timeout_error(err)
    render(
      json: {
        success: false,
        error: 'Timeout Error',
        status_code: 400
      },
      status: 400
    )
  end
end
