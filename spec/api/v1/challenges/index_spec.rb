require 'rails_helper'

RSpec.describe "challenges#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/challenges", params: params
  end

  describe 'basic fetch' do
    let!(:challenge1) { create(:challenge) }
    let!(:challenge2) { create(:challenge) }

    it 'works' do
      expect(ChallengeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['challenges'])
      expect(d.map(&:id)).to match_array([challenge1.id, challenge2.id])
    end
  end
end
