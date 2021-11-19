require "rails_helper"

RSpec.describe "challenges#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/challenges/#{challenge.id}", payload
  end

  describe "basic update" do
    let!(:challenge) { create(:challenge) }

    let(:payload) do
      {
        data: {
          id: challenge.id.to_s,
          type: "challenges",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ChallengeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { challenge.reload.attributes }
    end
  end
end
