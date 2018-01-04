# frozen_string_literal: true

class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div
  end
end

module Utilities
  class Markdown
    attr_reader :text

    def initialize(text:)
      @text = text
    end

    def call
      renderer = CodeRayify.new(options)
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
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        no_intra_emphasis: true,
        strikethrough: true,
        superscript: true
      }
    end
  end
end
