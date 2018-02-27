require "better_dig/version"

module BetterDig
  DIGGABLE_CLASSES = [Hash, Array].freeze
  INDIFFERENT_FIND = { Symbol => :to_s, String => :to_sym }.freeze

  def digg(key, *rest)
    value = self.is_a?(Array) ? self[key.to_i] : self[key]
    value = self[key.send(INDIFFERENT_FIND[key.class])] unless value
    return value             if value.nil? || rest.empty?
    return value.digg(*rest) if value.respond_to?(:digg)
    nil
  end
end

BetterDig::DIGGABLE_CLASSES.each { |klass| klass.send(:include, BetterDig) unless klass.method_defined?(:digg) }
