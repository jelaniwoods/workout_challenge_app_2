require 'rails_helper'

RSpec.describe "challenges#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/challenges/#{challenge.id}", params: params
  end

  describe 'basic fetch' do
    let!(:challenge) { create(:challenge) }

    it 'works' do
      expect(ChallengeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('challenges')
      expect(d.id).to eq(challenge.id)
    end
  end
end
