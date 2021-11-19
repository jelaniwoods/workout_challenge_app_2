require 'rails_helper'

RSpec.describe "challenges#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/challenges/#{challenge.id}"
  end

  describe 'basic destroy' do
    let!(:challenge) { create(:challenge) }

    it 'updates the resource' do
      expect(ChallengeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Challenge.count }.by(-1)
      expect { challenge.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
