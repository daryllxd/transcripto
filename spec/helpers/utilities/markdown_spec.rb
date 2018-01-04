# frozen_string_literal: true

# rubocop:disable Layout/EmptyLinesAroundArguments
# https://github.com/bbatsov/rubocop/issues/5224
RSpec.describe Utilities::Markdown, type: :service do
  context 'happy path' do
    it 'works (non-code example)' do
      sample_markdown = {
        text: <<~SENTINEL
          ## Hello

          Lorem Ipsum.

          Lorem Ipsum.

          - Lorem
          - Ipsum
        SENTINEL
      }

      converted_markdown = execute.call(sample_markdown)

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

    it 'with CodeRay-it also works' do
      sample_code = {
        text: <<~SENTINEL
          ``` ruby
            def hello
              1 + 'haha'
            end
          ```
          SENTINEL
      }

      converted_markdown = execute.call(sample_code)

      # Yes, the exact markdown because I need to make sure it works hehe.
      expect(converted_markdown).to eq(
        <<~SENTINEL
          <div class="CodeRay">
            <div class="code"><pre>  <span style="color:#080;font-weight:bold">def</span> <span style="color:#06B;font-weight:bold">hello</span>
              <span style="color:#00D">1</span> + <span style="background-color:hsla(0,100%,50%,0.05)"><span style="color:#710">'</span><span style="color:#D20">haha</span><span style="color:#710">'</span></span>
            <span style="color:#080;font-weight:bold">end</span>
          </pre></div>
          </div>
        SENTINEL
      )
    end
  end
end
# rubocop:enable Layout/EmptyLinesAroundArguments
