# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Undine::Configuration do
  describe '.configure' do
    context 'Given block' do
      specify 'the block receives a Congiuration object' do
        expect { |b| Undine.configure(&b) }.to yield_with_args(Undine::Configuration)
      end
    end
  end

  describe '.configuration' do
    subject { Undine.configuration }

    it { is_expected.to be_a(Undine::Configuration) }
    it { is_expected.to eq(Undine.configuration) }
  end
end
