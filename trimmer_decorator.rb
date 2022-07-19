require 'decorator.rb'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.split.first(10).join(' ')
  end
end