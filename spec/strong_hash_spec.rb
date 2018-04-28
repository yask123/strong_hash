RSpec.describe StrongHash do
  let(:test_hash) do
    {
      name: 'yask',
      age: 23
    }
  end

  it 'supports fetching hash keys by calling dot operator' do
    hash_obj = StrongHash.new(test_hash)
    expect(hash_obj.name).to eq(test_hash[:name])
    expect(hash_obj.age).to eq(test_hash[:age])
  end

  it 'raises NoMethodError for invalid keys' do
    hash_obj = StrongHash.new(test_hash)
    expect{ hash_obj.invalid_method }.to raise_error(NoMethodError)
  end
end
