require_relative '../student'

RSpec.describe Student do
  before :each do
    @new_student1 = Student.new(19, '1A', 'Jane Doe')
    @new_student2 = Student.new(19, '1B', 'John Doe', 'false')
    @new_student3 = Student.new(16, '1C', 'Jill Doe', 'false')
    @new_student4 = Student.new(16, '1D', 'Jack Doe', 'true')
  end
  describe '#new' do
    it 'takes four parameters and returns a student object' do
      expect(@new_student1).to be_an_instance_of(Student)
    end
  end
  describe '#name' do
    it 'returns the correct name' do
      expect(@new_student1.name).to eq('Jane Doe')
    end
    it 'can set the name correctly' do
      @new_student1.name = 'Jan'
      expect(@new_student1.name).to eq('Jan')
    end
  end
  describe '#age' do
    it 'returns the correct age' do
      expect(@new_student1.age).to eq(19)
    end
    it 'can set the age correctly' do
      @new_student1.age = 23
      expect(@new_student1.age).to eq(23)
    end
  end
  describe '#classroom' do
    it 'returns the correct classroom' do
      expect(@new_student1.classroom).to eq('1A')
    end
  end
  describe '#can_use_services?' do
    it 'shows true of false' do
      service = @new_student1.can_use_services?
      expect(service).to eq(true)
    end

    it 'shows true if the student is over 18' do
      service = @new_student2.can_use_services?
      expect(service).to eq(true)
    end

    it 'returns false if the student is under 18 and has no parent permission' do
      service = @new_student3.can_use_services?
      expect(service).to eq(false)
    end

    it 'returns true if the student is under 18 and has parent permission' do
      service = @new_student4.can_use_services?
      expect(service).to eq(true)
    end
  end

  describe '#play_hooky' do
    it 'returns "¯\(ツ)/¯" if the student can\'t use services' do
      expect(@new_student3.play_hooky).to eq('¯\(ツ)/¯')
    end

    it 'returns "¯\(ツ)/¯" if the student can use services' do
      expect(@new_student1.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'sets the classroom correctly' do
      classroom = Classroom.new('2A')
      @new_student1.classroom = classroom
      expect(@new_student1.classroom).to eq(classroom)
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@new_student1.to_json).to be_a(String)
    end
  end

  describe '#json_create' do
    it 'returns a Student object' do
      json_string = @new_student1.to_json
      json_student = JSON.parse(json_string)
      expect(Student.json_create(json_student)).to be_a(Student)
    end
  end
end
