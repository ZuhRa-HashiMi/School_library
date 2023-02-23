require 'rspec'
describe Teacher do
  describe '#initialize' do
    before :each do
      @teacher = Teacher.new(18, 'English', 'Hermela')
    end
    it 'creates a new Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
    it 'sets the age, name, specialization, and parent_permission attributes' do
      expect(@teacher).to have_attributes(age: 18)
      expect(@teacher).to have_attributes(name: 'Hermela')
      expect(@teacher).to have_attributes(specialization: 'English')
      expect(@teacher).to have_attributes(parent_permission: true)
    end
    it 'inherits the parent_permission attribute from Person' do
      expect(@teacher).to have_attributes(parent_permission: true)
    end
    it 'returns a hash representation of the Teacher object' do
      expect(@teacher.to_json).to eq(
        { 'id' => @teacher.id,
          'name' => 'Hermela',
          'age' => 18,
          'specialization' => 'English',
          'class' => 'Teacher',
          'parent_permission' => true }
      )
    end
  end
end
