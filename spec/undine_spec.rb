require 'spec_helper'

RSpec.describe Undine do
  let(:exception) { Exception.new('hoge') }

  describe '#process' do
    subject { Undine.new }

    it 'uses system method to open browser' do
      expect(subject).to receive(:system).with("open 'https://www.google.com/search?q=hoge'")

      subject.process(exception)
    end
  end
end
