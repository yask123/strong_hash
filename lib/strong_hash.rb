require 'strong_hash/version'
require 'active_support/core_ext/hash/indifferent_access'
# Returns a StrongHash instance which lets you fetch hash keys values
# by calling dot operator with key name
module StrongHash
  def self.new(hash)
    StrongHash.new(hash)
  end

  class StrongHash
    def initialize(hash)
      @hash = ActiveSupport::HashWithIndifferentAccess.new(hash)
    end

    def method_missing(method_name)
      raise NoMethodError unless @hash[method_name]
      @hash[method_name]
    end

    def respond_to_missing?(method_name, *args)
      super || @hash.respond_to?(method_name)
    end
  end
end
