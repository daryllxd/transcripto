# frozen_string_literal: true
class NullTalkSummary
  def title
    '(No Talks Yet)'
  end

  def body
    <<~SENTINEL
      There have been no talks yet.
    SENTINEL
  end
end
