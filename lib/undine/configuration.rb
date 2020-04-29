# frozen_string_literal: true

class Undine
  # @return [Undine::Configuration]
  def self.configuration
    @configuration ||= Configuration.new
  end

  # @yield [configuration] given Undine::Configuration object
  def self.configure
    yield configuration
  end

  class Configuration
    # @!attribute [rw] query_message_from
    #   This proc receives an unrescued exception
    #   and must returns String object used as query string of google
    #   @return [Proc]
    attr_accessor :query_message_from

    # @!attribute [rw] except_for
    #   Exception classes ignored from Undine
    #   @return [Exception, Array<Exception>]
    attr_accessor :except_for

    def initialize
      @query_message_from = :message.to_proc
      @except_for = SystemExit
    end
  end
end
