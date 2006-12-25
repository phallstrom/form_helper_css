# $Id$

# define alias_method_chain for Rails < 1.2
class Module
  unless method_defined? :alias_method_chain
    def alias_method_chain(target, feature)
      # Strip out punctuation on predicates or bang methods since
      # e.g. target?_without_feature is not a valid method name.
      aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
      yield(aliased_target, punctuation) if block_given?
      alias_method "#{aliased_target}_without_#{feature}#{punctuation}", target
      alias_method target, "#{aliased_target}_with_#{feature}#{punctuation}"
    end
  end
end

module ActionView
  module Helpers
    module TagHelper
      def css_options_for_tag(name, options={})
        name = name.to_sym
        options.stringify_keys!
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

      def tag_with_css(name, options={}, open=false)
        tag_without_css(name, css_options_for_tag(name, options), open)
      end
      alias_method_chain :tag, :css

      def content_tag_with_css(name, content, options={})
        content_tag_without_css(name, content, css_options_for_tag(name, options))
      end
      alias_method_chain :content_tag, :css
    end

    class InstanceTag
      alias_method :tag_without_error_wrapping, :tag_with_css
      alias_method :content_tag_without_error_wrapping, :content_tag_with_css
    end
  end
end
