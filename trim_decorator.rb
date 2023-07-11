require './base_decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable_object.correct_name.length > 10 ? @nameable_object.correct_name[0..9] : @nameable_object.correct_name
  end
end
