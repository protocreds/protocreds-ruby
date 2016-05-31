RSpec.describe "Protobuf helper methods" do
  context Protocreds::DateTime do
    subject(:datetime) { described_class.now }
    describe ".now" do
      it "creates a Protocreds::DateTime for the current time" do
        expect(described_class.now).to be_a described_class
      end
    end

    describe ".from_time" do
      it "creates a Protocreds::DateTime for a Time object" do
        expect(described_class.from_time(Time.now)).to be_a described_class
      end
    end

    describe "#to_time" do
      it "creates Time objects from a Protocreds::DateTime" do
        expect(datetime.to_time).to be_a Time
      end
    end
  end

  context Protocreds::Credential do
    describe "#add_caveat" do
      it "needs tests!"
    end
  end
end
