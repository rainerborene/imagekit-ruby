# frozen_string_literal: true

require "test_helper"

class Imagekit::UrlTest < ActiveSupport::TestCase
  setup do
    travel_to "2021-09-16"
  end

  test "should generate a lifetime signed url" do
    imagekit_url = Imagekit::Url.new("something").to_s
    expected_url = "https://ik.imagekit.io/testing/something?ik-s=7897b4b010aa6f541bcf6411148c965ab830e449"

    assert_equal expected_url, imagekit_url
  end

  test "should generate a signed url which expires" do
    imagekit_url = Imagekit::Url.new("something", expires_in: 1.week).to_s
    expected_url = "https://ik.imagekit.io/testing/something?ik-s=7b99ae57badcd86dbce7840665a311919bad5838&ik-t=1632366000"

    assert_equal expected_url, imagekit_url
  end

  test "should support chained transformations" do
    transformation = [
      { width: 100, height: 100 },
      { rotation: 90 }
    ]

    imagekit_url = Imagekit::Url.new("something", transformation: transformation)

    assert_equal "tr:w-100,h-100:rt-90/something", imagekit_url.path
  end
end
