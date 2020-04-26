# frozen_string_literal: true

class Undine
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :query_message_from

    def initialize
      @query_message_from = :message.to_proc
    end
  end
end
