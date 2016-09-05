describe StringObfuscator do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe ".obfuscate_by_percent" do
    context "with a long value" do
      subject { described_class.obfuscate_by_percent("Hello? It's me, Danilo", percent: 50) }

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("*********** me, Danilo")
      end
    end

    context "with a long value, percent set", :focus do
      subject { described_class.obfuscate_by_percent("Hello? It's me, Danilo", percent: 25) }

      it "should return >= 25% obfuscated" do
        expect(subject).to eq("****** It's me, Danilo")
      end
    end

    context "with a long value, from set to `right`" do
      subject { described_class.obfuscate_by_percent("Hello? It's me, Danilo", percent: 25, from: :right) }

      it "should return >= 25% obfuscated starting from the right side" do
        expect(subject).to eq("Hello? It's me, ******")
      end
    end

    context "with a long value, and max_unobfuscated_length set" do
      subject { described_class.obfuscate_by_percent("Hello? It's me, Danilo", percent: 50, max_unobfuscated_length: 4) }

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("******************nilo")
      end
    end

    context "with a short value" do
      subject { described_class.obfuscate_by_percent("Boo", percent: 50)}

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("**o")
      end
    end

    context "with obfuscation_character set" do
      subject { described_class.obfuscate_by_percent("Hello? It's me, Danilo", percent: 50, obfuscation_character: "$") }

      it "uses the given character to obfuscate" do
        expect(subject).to eq("$$$$$$$$$$$ me, Danilo")
      end
    end

    context "with an empty String" do
      subject { described_class.obfuscate_by_percent("", percent: 50) }

      it { is_expected.to eq("") }
    end

    context "given a percent > 100" do
      it "raises an ArgumentError" do
        expect { described_class.obfuscate_by_percent("abc", percent: 120) }.to raise_error(ArgumentError)
      end
    end

    context "given a percent < 0" do
      it "raises an ArgumentError" do
        expect { described_class.obfuscate_by_percent("abc", percent: -50) }.to raise_error(ArgumentError)
      end
    end

    [123, nil, true].each do |value|
      context "with a non-String value of #{value.to_s}" do
        subject { described_class.obfuscate_by_percent(value, percent: 50) }

        it { is_expected.to eq(value) }
      end
    end
  end
end
