RSpec.describe Protocreds::Authenticator do
  let(:example_key)   { "DEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF" }
  let(:example_value) { "ponycopter" }

  subject(:authenticator) { described_class.new(example_key) }

  it "authenticates values" do
    result = authenticator.authenticate(example_value)
    expect(result).to be_a String
    expect(result.length).to eq 32
  end
end
