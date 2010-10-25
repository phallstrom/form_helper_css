# $Id$

module ActionView
  module Helpers
    module TagHelper

      FORM_HELPER_CSS_OPTIONS = {:append => false}

      def css_options_for_tag(name, options={})
        name = name.to_sym
        options = options.stringify_keys
        if FORM_HELPER_CSS_OPTIONS[:append] == false && options.has_key?('class')
          return options
        elsif name == :input and options['type']
          return options if (options['type'] == 'hidden')
          if FORM_HELPER_CSS_OPTIONS[:append] && options['class']
            options['class'] << ' ' + options['type'].dup
          else
            options['class'] = options['type'].dup
          end
          options['class'] << ' button' if ['submit', 'reset'].include? options['type']
          options['class'] << ' text' if options['type'] == 'password'
        elsif name == :textarea
          if FORM_HELPER_CSS_OPTIONS[:append] && options['class']
            options['class'] << ' text'
          else
            options['class'] = 'text'
          end
        end
        if options['class']
          options['class'] = options['class'].to_s.strip.split(/\s+/).uniq.join(' ') # de-dup the class list
        end
        options
      end

      def tag_with_css(name, options=nil, open=false, escape=true)
        tag_without_css(name, css_options_for_tag(name, options || {}), open, escape)
      end
      alias_method_chain :tag, :css

      def content_tag_string_with_css(name, content, options, escape=true)
        content_tag_string_without_css(name, content, css_options_for_tag(name, options || {}), escape)
      end
      alias_method_chain :content_tag_string, :css
    end

    class InstanceTag
      alias_method :tag_without_error_wrapping, :tag_with_css
    end
  end
end
