require "rails_helper"

RSpec.describe "participations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/participations/#{participation.id}", params: params
  end

  describe "basic fetch" do
    let!(:participation) { create(:participation) }

    it "works" do
      expect(ParticipationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("participations")
      expect(d.id).to eq(participation.id)
    end
  end
end
