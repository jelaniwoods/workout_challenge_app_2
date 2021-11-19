require 'rails_helper'

RSpec.describe "challenges#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/challenges", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'challenges',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ChallengeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Challenge.count }.by(1)
    end
  end
end
