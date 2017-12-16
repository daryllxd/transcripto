# frozen_string_literal: true
class TranscriptoError < StandardError
  def valid?
    false
  end
end
