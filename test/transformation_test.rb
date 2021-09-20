# frozen_string_literal: true

require "test_helper"

class Imagekit::TransformationTest < ActiveSupport::TestCase
  test "should return single transformation step" do
    transformation = Imagekit::Transformation.new(
      width: 100,
      height: 200,
      rotation: 90
    )

    assert_equal "w-100,h-200,rt-90", transformation.to_s
  end

  test "should allow multiple values on border property" do
    transformation = Imagekit::Transformation.new(
      border: [10, "000000"]
    )

    assert_equal "b-10-000000", transformation.to_s
  end

  test "should not allow unknown transformation options" do
    assert_raises NoMethodError do
      Imagekit::Transformation.new(resize: 100)
    end
  end
end
