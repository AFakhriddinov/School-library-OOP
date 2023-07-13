require_relative '../person'

RSpec.describe Person do
  before :each do
    @new_person = Person.new(14, 'Sam', 'true')
  end

  describe '#new' do
    it 'it gets three parameters and outputs person object' do
      expect(@new_person).to be_an_instance_of(Person)
    end
  end

  describe '#name' do
    it 'shows the correct name' do
      expect(@new_person.name).to eq('Sam')
    end

    it 'can set the name correctly' do
      @new_person.name = 'Jane'
      expect(@new_person.name).to eq('Jane')
    end
  end

  describe '#age' do
    it 'shows the correct age' do
      expect(@new_person.age).to eq(14)
    end

    it 'can set the age correctly' do
      @new_person.age = 30
      expect(@new_person.age).to eq(30)
    end
  end

  describe '#parent_permission' do
    it 'shows the correct parent_permission' do
      expect(@new_person.parent_permission).to eq('true')
    end
  end

  describe '#can_use_services?' do
    it 'shows true of false' do
      service = @new_person.can_use_services?
      expect(service).to eq(true)
    end
  end

  describe '#correct_name' do
    it 'shows the name' do
      name = @new_person.correct_name
      expect(name).to eq('Sam')
    end
  end
end