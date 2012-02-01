# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "form_helper_css/version"

Gem::Specification.new do |s|
  s.name        = "form_helper_css"
  s.version     = FormHelperCss::VERSION
  s.authors     = ["Philip Hallstrom"]
  s.email       = ["philip at pjkh dot com"]
  s.homepage    = "https://github.com/phallstrom/form_helper_css"
  s.summary     = "enhances the default tag helpers to automatically add CSS classes to form elements"
  s.description = "This plugin enhances the default tag helpers to automatically add CSS classes
to form elements. It's similar to the enhanced_form_tag_helper plugin,
but takes a different approach by directly intercepting the tag and
content_tag methods, and should therefore work in all situations where
form elements are created, especially the <tt>FormHelper</tt> and more exotic
ones like button_to."

  s.rubyforge_project = "form_helper_css"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
   s.add_development_dependency "rake"
  # s.add_runtime_dependency "rest-client"
end
