# frozen_string_literal: true

module V1
  class ApiController < ApplicationController
    include PowerMethods
    include AuthenticationMethods
  end
end
