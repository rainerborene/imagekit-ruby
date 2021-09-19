# frozen_string_literal: true

module Imagekit
  ALIASES = {
    width: "w",
    height: "h",
    aspect_ratio: "ar",
    quality: "q",
    crop: "c",
    crop_mode: "cm",
    focus: "fo",
    x: "x",
    y: "y",
    format: "f",
    radius: "r",
    background: "bg",
    border: "b",
    rotation: "rt",
    rotate: "rt",
    blur: "bl",
    named: "n",
    overlay_image: "oi",
    overlay_image_aspect_ratio: "oiar",
    overlay_image_background: "oibg",
    overlay_image_border: "oib",
    overlay_image_dpr: "oidpr",
    overlay_image_quality: "oiq",
    overlay_image_cropping: "oic",
    overlay_image_focus: "oifo",
    overlay_image_trim: "oit",
    overlay_x: "ox",
    overlay_y: "oy",
    overlay_focus: "ofo",
    overlay_height: "oh",
    overlay_width: "ow",
    overlay_text: "ot",
    overlay_text_font_size: "ots",
    overlay_text_font_family: "otf",
    overlay_text_color: "otc",
    overlay_text_transparency: "oa",
    overlay_alpha: "oa",
    overlay_text_typography: "ott",
    overlay_background: "obg",
    overlay_text_encoded: "ote",
    overlay_text_width: "otw",
    overlay_text_background: "otbg",
    overlay_text_padding: "otp",
    overlay_text_inner_alignment: "otia",
    overlay_radius: "or",
    progressive: "pr",
    lossless: "lo",
    trim: "t",
    metadata: "md",
    color_profile: "cp",
    default_image: "di",
    dpr: "dpr",
    effect_sharpen: "e-sharpen",
    effect_usm: "e-usm",
    effect_contrast: "e-contrast",
    effect_gray: "e-grayscale",
    original: "orig"
  }

  Option = Struct.new(:name, :value) do
    def self.wrap(options)
      options.map do |name, value|
        Option.new(name, value)
      end
    end

    def self.names
      ALIASES.keys
    end

    def aliaz
      ALIASES.fetch(name)
    end

    def to_s
      [aliaz, *value].join("-")
    end
  end
end
