RSpec.describe Protocreds::Issuer do
  let(:example_key)    { "DEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF" }
  let(:example_key_id) { "test" }

  let(:example_assertion) do
    Protocreds::Assertion.new(
      type:  "exp",
      value: Protocreds::DateTime.from_time(Time.now + 86_400)
    )
  end

  subject(:issuer) { described_class.new(key: example_key, key_id: example_key_id) }

  it "creates new Protocreds" do
    protocred = issuer.issue_credential(assertions: [example_assertion])

    expect(protocred).to be_a Protocreds::Credential
    expect(protocred.identifier).to be_a Protocreds::Identifier
  end
end
