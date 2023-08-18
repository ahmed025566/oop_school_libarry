require './classroom'
require './student'

describe 'Classroom tests' do
  classroom = Classroom.new('Label')
  it 'should make a new class' do
    expect(classroom.label).to eql('Label')
    expect(classroom.students).to be_empty
  end

  it 'should add a student to classroom' do
    student = Student.new(333, 23, 'AHmed', parent_permission: false)
    classroom.add_student(student)
    expect(classroom.students).to include(student)
    expect(student.classroom).to eq(classroom)
  end
end
