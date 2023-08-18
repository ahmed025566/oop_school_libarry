require './capitalized_decorator'
require './trimmer_decorator'
require './person'

describe 'Decorators' do
  let(:nameable) { 'maximilianus' }
  let(:person) { Person.new(777, 23, nameable) }
  it 'creates a new base decorator object' do
    base_decorator = BaseDecorator.new(person)
    expect(base_decorator).to be_an_instance_of(BaseDecorator)
    expect(base_decorator.correct_name).to eq('maximilianus')
  end

  it 'should capatlize an inserted name' do
    capatlize = CapitalizedDecorator.new(person)
    expect(capatlize.correct_name).to eq('Maximilianus')
  end

  it 'Should trim names more than 10 charceters' do
    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq('maximilian')
  end
end

describe 'Nameable' do
  let(:nameable) { Nameable.new }
  it 'raises NotImplementedError when correct_name is not implemented' do
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
