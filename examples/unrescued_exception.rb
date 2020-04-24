require 'undine'

Undine.load

def something_function
  'hoge'.foo
rescue => e
  warn e.message
  raise e
end

something_function
