require 'bootstrap/view_components/version'

Gem::Specification.new do |spec|
  spec.name          = 'bootstrap-view_component'
  spec.version       = Bootstrap::ViewComponent::VERSION
  spec.summary       = "Reusable ViewComponents for Bootstrap 5"
  spec.description   = "Reusable ViewComponents for Bootstrap 5"
  spec.authors       = ["Zsolt Kozaroczy"]
  spec.email         = 'kiskoza@gmail.com'
  spec.files         = Dir["CHANGELOG.md", "LICENSE.txt", "README.md", "lib/**/*", "app/**/*"]
  spec.require_paths = ["lib"]
  spec.homepage      = 'https://github.com/kiskoza/bootstrap-view_component'
  spec.license       = 'MIT'

  spec.add_dependency 'view_component', '~> 2.30.0'
end
