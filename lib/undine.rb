# frozen_string_literal: true

require 'undine/version'
require 'undine/configuration'
require 'cgi'
require 'English'

class Undine
  # Inserts a post-process executed just before exiting a Ruby process.
  # This work utilizes `Kernel.at_exit`. Refer to its doc how it works.
  #
  # @see https://docs.ruby-lang.org/ja/latest/method/Kernel/m/at_exit.html
  def self.load
    at_exit do
      exception = $ERROR_INFO

      Undine.process(exception) unless exception.nil?
    end
  end

  def self.process(exception)
    new(Undine.configuration).process(exception)
  end

  # @param configuration [Undine::Configuration] configuration for new Undine object
  def initialize(configuration)
    @configuration = configuration
  end

  # Open your browser for googling with the message of a given exception
  #
  # @param [Exception] exception
  def process(exception)
    return if ignore?(exception)

    url = "https://www.google.com/search?q=#{CGI.escape(query_message_from(exception))}"

    system "open '#{url}'"
  end

  def query_message_from(exception)
    @configuration.query_message_from.call(exception)
  end

  private

  def ignore?(exception)
    return false unless @configuration.respond_to?(:except_for)

    ignored_exceptions = Array(@configuration.except_for)
    ignored_exceptions.any? { |klass| exception.is_a?(klass) }
  end
end
