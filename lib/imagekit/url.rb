# frozen_string_literal: true

module Imagekit
  class Url
    NO_EXPIRE = 9999999999

    attr_reader :key, :endpoint, :transformation, :signed, :expires_in

    def initialize(key, options = {})
      @key = key
      @endpoint = options[:endpoint] || Imagekit.endpoint
      @transformation = Array.wrap(options[:transformation])
      @signed = options.fetch(:signed, true)
      @expires_in = options[:expires_in]
    end

    def path
      @path ||= [transformations, key].compact.join("/")
    end

    def query
      { "ik-s" => signature, "ik-t" => (timestamp if expires?) }
        .compact
        .to_query
        .prepend("?") if signed
    end

    def to_s
      "https://#{endpoint}/#{path}#{query}"
    end

    private
      def expires?
        timestamp != NO_EXPIRE
      end

      def transformations
        Transformation.chain(transformation).prepend("tr:") if transformation.any?
      end

      def timestamp
        @timestamp ||= expires_in.present? ? expires_in.from_now.to_i : NO_EXPIRE
      end

      def signature
        OpenSSL::HMAC.hexdigest("SHA1", Imagekit.private_key, "#{path}#{timestamp}")
      end
  end
end
