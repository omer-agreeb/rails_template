class BadRequestError < StandardError
  attr_accessor :message, :options

  def initialize(error, options = {})
    self.message = error
    self.options = options
    super(message)
  end
end
