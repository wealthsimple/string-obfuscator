require "string-obfuscator/version"

module StringObfuscator
  # Obfuscate as close to 50% of the value as possible, without ever revealing
  # more than 50%.
  def self.obfuscate(value, min_obfuscation_percent: 0.5, max_unobfuscated_length: nil, obfuscation_character: "*")
    return value unless value.is_a?(String)

    obfuscate_length = (value.length * min_obfuscation_percent).ceil
    visible_length = value.length - obfuscate_length

    # If `max_unobfuscated_length` is set, ensure that we don't show more than that.
    if !max_unobfuscated_length.nil? && visible_length > max_unobfuscated_length
      visible_length = max_unobfuscated_length
      obfuscate_length = value.length - visible_length
    end

    obfuscation_character * obfuscate_length + value[-visible_length..-1]
  end
end
