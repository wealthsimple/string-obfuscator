describe StringObfuscator do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe ".obfuscate (by percent)" do
    context "with a long value" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", percent: 50) }

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("*********** me, Danilo")
      end
    end

    context "with a long value, from set to `right`" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", percent: 25, from: :right) }

      it "should return >= 25% obfuscated starting from the right side" do
        expect(subject).to eq("Hello? It's me, ******")
      end
    end

    context "with a long value, and max_unobfuscated_length set" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", percent: 50, max_unobfuscated_length: 4) }

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("******************nilo")
      end
    end

    context "with a short value" do
      subject { described_class.obfuscate("Boo", percent: 50)}

      it "should return >= 50% obfuscated" do
        expect(subject).to eq("**o")
      end
    end

    context "with obfuscation_character set" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", percent: 50, obfuscation_character: "$") }

      it "uses the given character to obfuscate" do
        expect(subject).to eq("$$$$$$$$$$$ me, Danilo")
      end
    end
  end

  describe ".obfuscate (by length)" do
    context "with a long value" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", length: 5) }

      it "should return 5 characters obfuscated" do
        expect(subject).to eq("*****? It's me, Danilo")
      end
    end

    context "with a long value, from set to `right`" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", length: 5, from: :right) }

      it "should return 5 characters obfuscated starting from the right side" do
        expect(subject).to eq("Hello? It's me, D*****")
      end
    end

    context "with a long value, and max_unobfuscated_length set" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", length: 5, max_unobfuscated_length: 4) }

      it "should return max_unobfuscated_length obfuscated" do
        expect(subject).to eq("******************nilo")
      end
    end

    context "with length > the length of the value" do
      subject { described_class.obfuscate("Boo", length: 50)}

      it "should return the entire string obfuscated" do
        expect(subject).to eq("***")
      end
    end

    context "with obfuscation_character set" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", length: 5, obfuscation_character: "$") }

      it "uses the given character to obfuscate" do
        expect(subject).to eq("$$$$$? It's me, Danilo")
      end
    end

    context "with obfuscation_value set" do
      subject { described_class.obfuscate("Hello? It's me, Danilo", length: 5, obfuscation_value: "[obfuscated]") }

      it "uses the given character to obfuscate" do
        expect(subject).to eq("[obfuscated]? It's me, Danilo")
      end
    end
  end

  describe "invalid or missing params" do
    context "with an empty String" do
      subject { described_class.obfuscate("", percent: 50) }

      it { is_expected.to eq("") }
    end

    context "given a percent > 100" do
      it "raises an ArgumentError" do
        expect { described_class.obfuscate("abc", percent: 120) }.to raise_error(ArgumentError)
      end
    end

    context "given a percent < 0" do
      it "raises an ArgumentError" do
        expect { described_class.obfuscate("abc", percent: -50) }.to raise_error(ArgumentError)
      end
    end

    [123, nil, true].each do |value|
      context "with a non-String value of #{value.to_s}" do
        subject { described_class.obfuscate(value, percent: 50) }

        it { is_expected.to eq(value) }
      end
    end
  end
end
