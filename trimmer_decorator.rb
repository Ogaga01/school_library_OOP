require_relative './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.chars.first(10).join
  end
end
