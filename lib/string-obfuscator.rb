require "string-obfuscator/version"
require "bigdecimal"

module StringObfuscator
  # Obfuscate as close to 50% of the value as possible, without ever revealing
  # more than 50%.
  def self.obfuscate_by_percent(value, percent: 50, from: :left, max_unobfuscated_length: nil, obfuscation_character: "*")
    raise ArgumentError, "percent must be between 0 - 100" if percent > 100 || percent < 0
    return value unless value.is_a?(String)

    percent = BigDecimal.new(percent.to_s)
    obfuscate_length = (value.length * (percent / 100)).ceil
    visible_length = value.length - obfuscate_length

    # If `max_unobfuscated_length` is set, ensure that we don't show more than that.
    if !max_unobfuscated_length.nil? && visible_length > max_unobfuscated_length
      visible_length = max_unobfuscated_length
      obfuscate_length = value.length - visible_length
    end

    obfuscated_value = obfuscation_character * obfuscate_length
    if from.to_sym == :left
      obfuscated_value + value[-visible_length..-1]
    else
      value[0..(visible_length - 1)] + obfuscated_value
    end
  end
end
