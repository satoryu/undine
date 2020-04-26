# frozen_string_literal: true

require 'undine/version'
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
    new.process(exception)
  end

  def process(exception)
    url = "https://www.google.com/search?q=#{CGI.escape(exception.message)}"

    system "open '#{url}'"
  end
end
