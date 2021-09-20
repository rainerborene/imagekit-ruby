# frozen_string_literal: true

require "openssl"
require "active_support/configurable"
require "active_support/core_ext/array/wrap"

module Imagekit
  include ActiveSupport::Configurable

  autoload :Option, "imagekit/option"
  autoload :Transformation, "imagekit/transformation"
  autoload :Url, "imagekit/url"

  config_accessor :endpoint
  config_accessor :public_key
  config_accessor :private_key

  def self.url(key, options = {})
    Url.new(key, options).to_s
  end
end
