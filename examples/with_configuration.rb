require 'undine'

Undine.load

Undine.configure do |config|
  config.query_message_from = proc { |e| e.message.lines.join(' ') }
end

'hoge'.foo
# This statement raises the following exception:
#   examples/with_configuration.rb:9:in `<main>': undefined method `foo' for "hoge":String (NoMethodError)
#   Did you mean?  for
