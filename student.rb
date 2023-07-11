require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(
    age,
    classroom,
    name = 'Unknown',
    parent_permission = 'true',
    id = nil
  )
    super(age, name, parent_permission, id)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [@age, @classroom, @name, @parent_permission, @id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
