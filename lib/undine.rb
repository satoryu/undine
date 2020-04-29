# frozen_string_literal: true

require 'undine/version'
require 'undine/configuration'
require 'cgi'
require 'English'

class Undine
  def self.load
    at_exit do
      exception = $ERROR_INFO

      Undine.process(exception) unless exception.nil?
    end
  end

  def self.process(exception)
    new(Undine.configuration).process(exception)
  end

  def initialize(configuration)
    @configuration = configuration
  end

  def process(exception)
    return if ignore?(exception)

    url = "https://www.google.com/search?q=#{CGI.escape(query_message_from(exception))}"

    system "open '#{url}'"
  end

  private

  def query_message_from(exception)
    @configuration.query_message_from.call(exception)
  end

  def ignore?(exception)
    return false unless @configuration.respond_to?(:except_for)

    ignored_exceptions = Array(@configuration.except_for)
    ignored_exceptions.any? { |klass| exception.is_a?(klass) }
  end
end
