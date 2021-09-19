# frozen_string_literal: true

module Imagekit
  class Transformation
    attr_reader :options

    def self.chain(transformation)
      transformation.map { |operations| new(operations) }.join(":")
    end

    def initialize(new_options = {})
      @options = {}

      assign_options(new_options)
    end

    def assign_options(new_options)
      new_options.each do |key, value|
        public_send(key, *value)
      end
      self
    end

    def resize_to_fit(width, height)
      options.merge! width: width, height: height
    end

    def inspect
      inline_options = options.map do |key, value|
        "#{key}=#{value.join("-")}"
      end

      "#<#{self.class} #{inline_options.join(" ")}>"
    end

    def to_s
      Option.wrap(options).join(",") if options.present?
    end

    Option.names.each do |name|
      define_method name do |*value|
        options[name] = value
        self
      end
    end
  end
end
