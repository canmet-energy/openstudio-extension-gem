lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openstudio/extension/version'

Gem::Specification.new do |spec|
  spec.name          = 'openstudio-extension'
  spec.version       = OpenStudio::Extension::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Katherine Fleming', 'Nicholas Long', 'Daniel Macumber', 'David Goldwasser']
  spec.email         = ['katherine.fleming@nrel.gov', 'nicholas.long@nrel.gov', 'daniel.macumber@nrel.gov', 'david.goldwasser@nrel.gov']

  spec.homepage      = 'https://openstudio.net'
  spec.summary       = 'openstudio base gem for creating generic extensions with encapsulated data and measures.'
  spec.description   = 'openstudio base gem for creating generic extensions with encapsulated data and measures. Also contains ruby libraries that required by many measures.'
  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/NREL/openstudio-extension-gem/issues',
    'changelog_uri' => 'https://github.com/NREL/openstudio-extension-gem/blob/develop/CHANGELOG.md',
    # 'documentation_uri' =>  'https://www.rubydoc.info/gems/openstudio-extension-gem/#{gem.version}',
    'source_code_uri' => "https://github.com/NREL/openstudio-extension-gem/tree/v#{spec.version}"
  }

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|lib.measures.*tests|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.7.0'

  spec.add_dependency 'bundler', '>= 2.1.0'
  spec.add_dependency 'octokit', '~> 4.18.0' # for change logs
  spec.add_dependency 'openstudio_measure_tester', '~> 0.3.1'
  spec.add_dependency 'openstudio-workflow', '~> 2.2.0'
  spec.add_dependency 'parallel', '~> 1.19.1'

  spec.add_development_dependency 'openstudio-standards', '~> 0.2.13' # for os_lib unit tests
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
