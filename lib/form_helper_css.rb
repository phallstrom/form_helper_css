# $Id$

module ActionView
  module Helpers
    module TagHelper
      def css_options_for_tag(name, options={})
        name = name.to_sym
        options = options.stringify_keys
        if options.has_key? 'class'
          return options
        elsif name == :input and options['type']
          return options if (options['type'] == 'hidden')
          options['class'] = options['type'].dup
          options['class'] << ' button' if ['submit', 'reset'].include? options['type']
          options['class'] << ' text' if options['type'] == 'password'
        elsif name == :textarea
          options['class'] = 'text'
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
