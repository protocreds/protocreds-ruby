RSpec.describe Protocreds::Verifier do
  let(:default_key_id) { "k1" }

  let(:example_keys) do
    {
      "k0" => "DEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF",
      "k1" => "BADA55BADA55BADA55BADA55BADA55BADA55BADA55BADA55BADA55BADA55BADA"
    }
  end

  let(:example_keyring) { described_class.new(keys: example_keys, key_id: default_key_id) }

  it "needs tests!"
end
