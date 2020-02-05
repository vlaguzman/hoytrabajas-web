require 'rails_helper'

RSpec.describe HashesConverter do

  describe '#sanitize_array_values' do
    let(:example) do
      {
        list_alements_one: ['1,2,4,5,6'],
        list_alements_two: [1,2,4,5,6],
        list_alements_three: ['1'],
        other_key: 'Im other key',
        nil_value: nil
      }
    end

    it 'should converter array values with in string to idividual values' do
      expected_hash = {
        list_alements_one: [1,2,4,5,6],
        list_alements_two:[1, 2, 4, 5, 6],
        list_alements_three: [1],
        other_key: 'Im other key',
        nil_value: nil
      }

      expect(subject.sanitize_array_values(hash: example)).to eq(expected_hash)
    end
  end

  describe '#validate_presence_values' do
    let(:example_object) do
      {
        a: '',
        b: nil,
        c: 'no empty',
        d: :symbol,
        e: {},
        f: 0,
        g: 20324,
      }
    end

    it "Should change remove the empty keys" do
      expected_hash = {
        c: 'no empty',
        d: :symbol,
        g: 20324,
        f: 0
      }

      expect(subject.validate_presence_values(example_object)).to eq(expected_hash)
    end
  end

  describe "#remove_empty_keys" do
    context "When the user needs remove empty keys in hash" do
      it "should return an hash without empty keys" do
        test_hash = {
            a: :a,
            b: :b,
            c: ''
          }

        expect(subject.remove_empty_keys(test_hash)).to eq({a: :a, b: :b})
      end
    end
  end
end
