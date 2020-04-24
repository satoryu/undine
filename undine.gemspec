require_relative 'lib/undine/version'

Gem::Specification.new do |spec|
  spec.name          = 'undine'
  spec.version       = Undine::VERSION
  spec.authors       = ['Tatsuya Sato']
  spec.email         = ['satoryu.1981@gmail.com']

  spec.summary       = %q{Open your browser for searching the message of an unrescued exception}
  spec.description   = %q{Open your browser for searching the message of an unrescued exception}
  spec.homepage      = 'https://github.com/satoryu/undine'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata["allowed_push_host"] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/satoryu/undine'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
end
