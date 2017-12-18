# frozen_string_literal: true

# rubocop:disable Layout/EmptyLinesAroundArguments
# https://github.com/bbatsov/rubocop/issues/5224
RSpec.describe Utilities::Markdown, type: :service do
  context 'happy path' do
    it 'works' do
      converted_markdown_attributes = {
        text: <<~SENTINEL
          ## Hello

          Lorem Ipsum.

          Lorem Ipsum.

          - Lorem
          - Ipsum
        SENTINEL
      }

      converted_markdown = execute.call(converted_markdown_attributes)

      expect(converted_markdown).to eq(
        <<~SENTINEL
          <h2>Hello</h2>

          <p>Lorem Ipsum.</p>

          <p>Lorem Ipsum.</p>

          <ul>
          <li>Lorem</li>
          <li>Ipsum</li>
          </ul>
        SENTINEL
      )
    end
  end
end
# rubocop:enable Layout/EmptyLinesAroundArguments
