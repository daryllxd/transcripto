# frozen_string_literal: true

module Utilities
  class Markdown
    attr_reader :text

    def initialize(text:)
      @text = text
    end

    def call
      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end

    private

    def options
      {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: '_blank' },
        space_after_headers: true,
        fenced_code_blocks: true
      }
    end

    def extensions
      {
        autolink: true,
        superscript: true,
        disable_indented_code_blocks: true
      }
    end
  end
end
