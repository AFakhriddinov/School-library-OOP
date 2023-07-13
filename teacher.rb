require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(
    age,
    specialization,
    name = 'Unknown',
    parent_permission = 'true',
    id = nil
  )
    super(age, name, parent_permission, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [@age, @specialization, @name, @parent_permission, @id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
