require 'spec_helper'

RSpec.describe Undine do
  let(:exception) { Exception.new('hoge') }
  let(:configuration) { double(:config, query_message_from: :message.to_proc ) }

  describe '#process' do
    subject { Undine.new(configuration) }

    it 'uses system method to open browser' do
      expect(subject).to receive(:system).with("open 'https://www.google.com/search?q=hoge'")

      subject.process(exception)
    end
  end

  describe '#query_message_from' do
    let(:exception) { Exception.new('foo') }

    subject { Undine.new(configuration).query_message_from(exception) }

    it { is_expected.to eq(exception.message) }
  end
end
