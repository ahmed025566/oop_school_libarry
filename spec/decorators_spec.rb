require './capitalized_decorator'
require './trimmer_decorator'
require './person'

describe 'Decorators' do
  it 'creates a new base decorator object' do
    nameable = 'maximilianus'
    base_decorator = BaseDecorator.new(nameable)
    expect(base_decorator).to be_an_instance_of(BaseDecorator)
  end

  it 'should capatlize an inserted name' do
    person = Person.new(777, 23, 'maximilianus')
    capatlize = CapitalizedDecorator.new(person)
    expect(capatlize.correct_name).to eq('Maximilianus')
  end

  it 'Should trim names more than 10 charceters' do
    person = Person.new(777, 23, 'maximilianus')
    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq('maximilian')
  end
end
