require "better_dig/version"

module BetterDig
  DIGGABLE_CLASSES = [Hash, Array].freeze
  INDIFFERENT_FIND = { Symbol => :to_s, String => :to_sym }.freeze

  def digg(key, *rest)
    value = self[key.to_i] if match_array?(key)
    value = find_indifferent_value_by(key) if self.is_a?(Hash)
    return value             if value.nil? || rest.empty?
    return value.digg(*rest) if value.respond_to?(:digg)
    nil
  end

  def fetch_path(path, default: nil, delimeter: '/')
    digg(*path.split(delimeter)) || default
  end

  private

  def match_array?(key)
    if self.is_a?(Array)
      return key.match(/\A[0-9]+\z/) if key.is_a?(String)
      return true if key.is_a?(Numeric)
    end
    false
  end

  def find_indifferent_value_by(key)
    self[key] || self[key.send(INDIFFERENT_FIND[key.class])]
  end
end

BetterDig::DIGGABLE_CLASSES.each { |klass| klass.send(:include, BetterDig) unless klass.method_defined?(:digg) }
