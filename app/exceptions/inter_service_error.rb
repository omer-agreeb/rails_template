class InterServiceError < StandardError
  attr_accessor :message, :options

  def initialize(error, options = {})
    self.message = error
    self.options = options
    super(message)
  end

  def error_message
    message['error'].to_s
  end

  def status_code
    message['status_code'] || 500
  end
end
