# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "imagekit"
require "active_support"
require "active_support/time"
require "active_support/test_case"
require "minitest/autorun"

Imagekit.configure do |config|
  config.endpoint = "ik.imagekit.io/testing"
  config.public_key = "public_test"
  config.private_key = "private_test"
end
