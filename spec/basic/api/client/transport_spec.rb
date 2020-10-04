# frozen_string_literal: true

RSpec.describe Basic::Api::Client::Transport do
  let(:basic_url) { 'https://test.example.com' }
  let(:headers) { {} }

  subject { described_class.new(basic_url: basic_url, headers: headers) }

  before(:all) do
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  describe '#get' do
    before do
      allow(subject).to receive(:allowed_methods).and_return([:get])

      stub_request(:get, 'https://test.example.com/my/path')
        .with(
          headers: { 'Accept' => '*/*' }
        ).to_return(status: 200, body: '{}', headers: {})
    end

    it 'responds with 200 status' do
      expect(subject.get('/my/path', {}).status).to eq(200)
    end
  end
end
