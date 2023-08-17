require './teacher'

describe 'Teacher tests' do
  teacher = Teacher.new(999, 55, 'Teacher', 'physics')
  it 'should return the proprties of teacher object' do
    expect(teacher).to be_an_instance_of(Teacher)
    expect(teacher.id).to eql(999)
    expect(teacher.age).to eql(55)
    expect(teacher.name).to eql('Teacher')
    expect(teacher.specialization).to eql('physics')
  end

  it 'should return the output of can_use_services method' do
    expect(teacher.can_use_services?).to be(true)
  end
end
