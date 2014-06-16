# Based on https://github.com/Team-Sass/Compass-Extension-Template

require 'compass'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('sass-color-helpers', :path => extension_path)

module SassColorHelpers
  VERSION = "2.0.0"
  DATE = "2014-06-16"
end
