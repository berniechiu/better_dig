require "better_dig/version"

module BetterDig
  DIGGABLE_CLASSES = [Hash, Array].freeze
  INDIFFERENT_FIND = { Symbol => :to_s, String => :to_sym }.freeze

  def digg(key, *rest)
    value = self[key.to_i] if match_array?(key)
    if self.is_a?(Hash)
      value = self[key]
      value = self[key.send(INDIFFERENT_FIND[key.class])] if value.nil?
    end
    return value             if value.nil? || rest.empty?
    return value.digg(*rest) if value.respond_to?(:digg)
    nil
  end

  private

  def match_array?(key)
    if self.is_a?(Array)
      return key.match(/\A[0-9]+\z/) if key.is_a?(String)
      return true if key.is_a?(Numeric)
    end
    false
  end
end

BetterDig::DIGGABLE_CLASSES.each { |klass| klass.send(:include, BetterDig) unless klass.method_defined?(:digg) }
