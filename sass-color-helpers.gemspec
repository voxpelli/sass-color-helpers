# Based on https://github.com/Team-Sass/Compass-Extension-Template

require './lib/sass-color-helpers'

Gem::Specification.new do |s|
  s.version = SassColorHelpers::VERSION
  s.date = SassColorHelpers::DATE

  s.name = "sass-color-helpers"
  s.description = %q{Sass Color Helpers}
  s.summary = %q{A collection of Sass color helpers (and some related math helpers) to make it easier and more fool-proof to implement a target design.}
  s.authors = ["Pelle Wessman"]
  s.email = ["pelle@kodfabrik.se"]
  s.homepage = "https://github.com/voxpelli/sass-color-helpers"

  s.files = ["README.md"]
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")

  s.required_rubygems_version = ">= 1.3.6"
  s.rubygems_version = %q{1.3.6}

  s.add_dependency("sass",    [">= 3.2.0"])
  s.add_dependency("compass", [">= 0.12.1"])
end
