require_relative '.test_rspe'

describe '#test_method' do
  it 'returns 4' do
    expect(test_method).to eql(4)
  end
end