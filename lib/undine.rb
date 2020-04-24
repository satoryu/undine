# frozen_string_literal: true

require 'undine/version'
require 'cgi'

module Undine
  def self.load
    at_exit do
      exception = $!

      unless exception.nil?
        search_url = "https://www.google.com/search?q=#{CGI.escape(exception.message)}"

        system "open '#{search_url}'"
      end
    end
  end
end
