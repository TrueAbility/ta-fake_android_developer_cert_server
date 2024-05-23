
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fake_android_developer_cert_server/version"

Gem::Specification.new do |spec|
  spec.name          = "fake_android_developer_cert_server"
  spec.version       = FakeAndroidDeveloperCertServer::VERSION
  spec.authors       = ["Dusty Jones"]
  spec.email         = ["dusty@trueability.com"]

  spec.summary       = %q{Fake server to test android developer cert api}

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
