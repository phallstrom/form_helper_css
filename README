= form_helper_css

== Description

This plugin enhances the default tag helpers to automatically add CSS classes
to form elements. It's similar to the <tt>enhanced_form_tag_helper</tt> plugin,
but takes a different approach by directly intercepting the <tt>tag</tt> and
<tt>content_tag</tt> methods, and should therefore work in all situations where
form elements are created, especially the <tt>FormHelper</tt> and more exotic
ones like <tt>button_to</tt>.

The following elements are enhanced:

* <tt><input></tt> tags get their type as class name
* submit and reset buttons additionally get the class name _button_
* password fields additionally get the class name _text_
* <tt><textarea></tt> tags get the class name _text_
* <tt><select></tt> and <tt><button></tt> tags are not enhanced

If any helper options already specify a class, nothing will be changed. If you
don't want a class to be added, pass <tt>:class => nil</tt>.

There is a single option which can be set in the following manner:

  ActionView::Helpers::TagHelper::FORM_HELPER_CSS_OPTIONS.merge!(:append => true)

If set to true, then even if a class is specified, the magical classes will be appended to the output.

== License

The <tt>form_helper_css</tt> plugin is released under the MIT license.

== Author

Philip Hallstrom <philip at pjkh dot com>

== Original Author

Markus Koller <toupeira at gmx dot ch>

http://snafu.diarrhea.ch

24 December 2006
