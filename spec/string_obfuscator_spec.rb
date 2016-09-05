describe StringObfuscator do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe ".obfuscate" do
    context "with a long value" do
      subject { described_class.obfuscate("Hello? It's me, Danilo") }

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("*********** me, Danilo")
      end
    end

    context "with a long value, and max_unobfuscated_length set" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", max_unobfuscated_length: 4) }

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("******************nilo")
      end
    end

    context "with a short value" do
      subject { described_class.obfuscate("Boo")}

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("**o")
      end
    end

    context "with obfuscation_character set" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", obfuscation_character: "$") }

      it "uses the given character to obfuscate" do
        expect(subject).to eq("$$$$$$$$$$$ me, Danilo")
      end
    end

    context "with an empty String" do
      subject { described_class.obfuscate("") }

      it { is_expected.to eq("") }
    end

    [123, nil, true].each do |value|
      context "with a non-String value of #{value.to_s}" do
        subject { described_class.obfuscate(value) }

        it { is_expected.to eq(value) }
      end
    end
  end
end
