# $Id$

require 'test/unit'
require 'rubygems'
require 'action_controller'

require 'init'

class FormHelperCssTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormHelper

  def test_tag_helper
    assert_equal '<br />', tag(:br)
    assert_equal '<p></p>', content_tag(:p, '')
    assert_equal '<input type="text" />', tag(:input, :type => 'text', :class => nil)
    assert_equal '<textarea></textarea>', content_tag(:textarea, '', :class => nil)
  end

  def test_url_helper
    assert_match 'class="submit button"', button_to('button', '/')
  end

  def test_form_tag_helper
    assert_match 'class="checkbox"', check_box_tag('checkbox')
    assert_match 'class="file"', file_field_tag('file')
    assert_no_match /class=".+"/, hidden_field_tag('hidden')
    assert_match 'class="password text"', password_field_tag('password')
    assert_match 'class="radio"', radio_button_tag('radio', 'value')
    assert_match 'class="submit button"', submit_tag('submit')
    assert_match 'class="reset button"', submit_tag('reset', :type => 'reset')
    assert_match 'class="button"', submit_tag('submit', :type => 'button')
    assert_match 'class="text"', text_area_tag('text')
    assert_match 'class="text"', text_field_tag('text')
  end

  def test_form_helper
    assert_match 'class="checkbox"', check_box(:object, :field)
    assert_match 'class="file"', file_field(:object, :field)
    assert_no_match /class=".+"/, hidden_field(:object, :field)
    assert_match 'class="password text"', password_field(:object, :field)
    assert_match '', radio_button(:object, :field, 'value')
    assert_match 'class="text"', text_area(:object, :field)
    assert_match 'class="text"', text_field(:object, :field)
  end

  protected
    def protect_against_forgery?
      false
    end
end
