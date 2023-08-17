require './student'
require './classroom'

describe 'Student tests' do
  student = Student.new(666, 23, 'Ahmed', parent_permission: false)
  it 'should initialize a new student object' do
    expect(student).to be_a(Student)
    expect(student.id).to eq(666)
    expect(student.age).to eq(23)
    expect(student.name).to eq('Ahmed')
    expect(student.parent_permission).to eq(false)
  end
  it 'should test play hokey method' do
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end
  it 'should add a student to a classroom' do
    geography = Classroom.new('Geography')
    student.classroom = geography
    expect(student.classroom).to eq(geography)
    expect(geography.students).to include(student)
  end
end
