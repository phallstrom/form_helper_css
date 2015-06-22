# form_helper_css

## Description

This plugin enhances the default tag helpers to automatically add CSS classes
to form elements. It's similar to the `enhanced_form_tag_helper` plugin,
but takes a different approach by directly intercepting the `tag` and
`content_tag` methods, and should therefore work in all situations where
form elements are created, especially the `FormHelper` and more exotic
ones like `button_to`.

The following elements are enhanced:

* `<input>` tags get their type as class name
* submit and reset buttons additionally get the class name _button_
* password fields additionally get the class name _text_
* `<textarea>` tags get the class name _text_
* `<select>` and `<button>` tags are not enhanced

If any helper options already specify a class, nothing will be changed. If you
don't want a class to be added, pass `:class => nil`.

There is a single option which can be set in the following manner:

  ActionView::Helpers::TagHelper::FORM_HELPER_CSS_OPTIONS.merge!(:append => true)

If set to true, then even if a class is specified, the magical classes will be appended to the output.

## License

The `form_helper_css` plugin is released under the MIT license.

## Author

Philip Hallstrom <philip at pjkh dot com>

## Original Author

Markus Koller <toupeira at gmx dot ch>

http://snafu.diarrhea.ch

24 December 2006
