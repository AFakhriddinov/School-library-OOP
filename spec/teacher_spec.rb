require_relative '../teacher'
RSpec.describe Teacher do
  before :each do
    @new_teacher1 = Teacher.new(28, 'Plantae', 'Jane Doe')
    @new_teacher2 = Teacher.new(28, 'Animalia', 'John Doe', 'false')
    @new_teacher3 = Teacher.new(16, 'Fungi', 'Jill Doe', 'false')
    @new_teacher4 = Teacher.new(16, 'Protista', 'Jack Doe', 'true')
  end
  describe '#new' do
    it 'takes four parameters and returns a Teacher object' do
      expect(@new_teacher1).to be_an_instance_of(Teacher)
    end
  end
  describe '#name' do
    it 'returns the correct name' do
      expect(@new_teacher1.name).to eq('Jane Doe')
    end
    it 'can set the name correctly' do
      @new_teacher1.name = 'John'
      expect(@new_teacher1.name).to eq('John')
    end
  end
  describe '#age' do
    it 'returns the correct age' do
      expect(@new_teacher1.age).to eq(28)
    end
    it 'can set the age correctly' do
      @new_teacher1.age = 40
      expect(@new_teacher1.age).to eq(40)
    end
  end
  describe '#specialization' do
    it 'returns the correct specialization' do
      expect(@new_teacher1.specialization).to eq('Plantae')
    end
  end
  describe '#can_use_services?' do
    it 'returns true as defualt' do
      expect(@new_teacher1.can_use_services?).to eq(true)
    end

    it 'returns true if the teacher\'s parent permission is false' do
      expect(@new_teacher2.can_use_services?).to eq(true)
    end

    it 'returns true if the teacher\'s parent permission is false and/or the age is under 18' do
      expect(@new_teacher3.can_use_services?).to eq(true)
      expect(@new_teacher4.can_use_services?).to eq(true)
    end
  end
end
