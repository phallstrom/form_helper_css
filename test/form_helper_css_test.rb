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

  def setup
    ActionView::Helpers::TagHelper::FORM_HELPER_CSS_OPTIONS.merge!(:append => false)
  end

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

  def test_form_tag_helper_with_class
    assert_match 'class="foo"', check_box_tag('checkbox', 'value', false, :class => 'foo')
    assert_match 'class="foo"', file_field_tag('file', :class => 'foo')
    assert_match 'class="foo"', hidden_field_tag('hidden', 1, :class => 'foo')
    assert_match 'class="foo"', password_field_tag('password', nil, :class => 'foo')
    assert_match 'class="foo"', radio_button_tag('radio', 'value', false, :class => 'foo')
    assert_match 'class="foo"', submit_tag('submit', :class => 'foo')
    assert_match 'class="foo"', submit_tag('reset', :type => 'reset', :class => 'foo')
    assert_match 'class="foo"', submit_tag('submit', :type => 'button', :class => 'foo')
    assert_match 'class="foo"', text_area_tag('text', nil, :class => 'foo')
    assert_match 'class="foo"', text_field_tag('text', nil, :class => 'foo')
  end

  def test_form_tag_helper_with_class_and_append
    ActionView::Helpers::TagHelper::FORM_HELPER_CSS_OPTIONS.merge!(:append => true)
    assert_match 'class="foo checkbox"', check_box_tag('checkbox', 'value', false, :class => 'foo')
    assert_match 'class="foo file"', file_field_tag('file', :class => 'foo')
    assert_match 'class="foo"', hidden_field_tag('hidden', 1, :class => 'foo')
    assert_match 'class="foo password text"', password_field_tag('password', nil, :class => 'foo')
    assert_match 'class="foo radio"', radio_button_tag('radio', 'value', false, :class => 'foo')
    assert_match 'class="foo submit button"', submit_tag('submit', :class => 'foo')
    assert_match 'class="foo reset button"', submit_tag('reset', :type => 'reset', :class => 'foo')
    assert_match 'class="foo button"', submit_tag('submit', :type => 'button', :class => 'foo')
    assert_match 'class="foo text"', text_area_tag('text', nil, :class => 'foo')
    assert_match 'class="foo text"', text_field_tag('text', nil, :class => 'foo')
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

  def test_form_helper_with_class
    assert_match 'class="foo"', check_box(:object, :field, :class => 'foo')
    assert_match 'class="foo"', file_field(:object, :field, :class => 'foo')
    assert_match 'class="foo"', hidden_field(:object, :field, :class => 'foo')
    assert_match 'class="foo"', password_field(:object, :field, :class => 'foo')
    assert_match 'class="foo"', radio_button(:object, :field, 'value', :class => 'foo')
    assert_match 'class="foo"', text_area(:object, :field, :class => 'foo')
    assert_match 'class="foo"', text_field(:object, :field, :class => 'foo')
  end

  def test_form_helper_with_class_and_append
    ActionView::Helpers::TagHelper::FORM_HELPER_CSS_OPTIONS.merge!(:append => true)
    assert_match 'class="foo checkbox"', check_box(:object, :field, :class => 'foo')
    assert_match 'class="foo file"', file_field(:object, :field, :class => 'foo')
    assert_match 'class="foo"', hidden_field(:object, :field, :class => 'foo')
    assert_match 'class="foo password text"', password_field(:object, :field, :class => 'foo')
    assert_match 'class="foo radio"', radio_button(:object, :field, 'value', :class => 'foo')
    assert_match 'class="foo text"', text_area(:object, :field, :class => 'foo')
    assert_match 'class="foo text"', text_field(:object, :field, :class => 'foo')
  end

  def test_form_helper_with_duplicate_classes_and_append
    ActionView::Helpers::TagHelper::FORM_HELPER_CSS_OPTIONS.merge!(:append => true)
    assert_match 'class="foo bar checkbox"', check_box(:object, :field, :class => 'foo bar foo')
    assert_match 'class="foo bar file"', file_field(:object, :field, :class => 'foo bar foo')
    assert_match 'class="foo bar foo"', hidden_field(:object, :field, :class => 'foo bar foo')
    assert_match 'class="foo bar password text"', password_field(:object, :field, :class => 'foo bar foo')
    assert_match 'class="foo bar radio"', radio_button(:object, :field, 'value', :class => 'foo bar foo')
    assert_match 'class="foo bar text"', text_area(:object, :field, :class => 'foo bar foo')
    assert_match 'class="foo bar text"', text_field(:object, :field, :class => 'foo bar foo')
  end


  protected
    def protect_against_forgery?
      false
    end
end
