# frozen_string_literal: true

module PowerMethods
  extend ::ActiveSupport::Concern

  included do
    include Consul::Controller

    current_power do
      class_power_name.new
    end

    require_power_check
  end

  private

  def class_power_name
    "#{resource_name.classify}Power".constantize
  end

  def resource_name
    @resource_name ||= controller_name.singularize
  end
end
