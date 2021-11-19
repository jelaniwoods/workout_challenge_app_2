require "rails_helper"

RSpec.describe "participations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/participations/#{participation.id}"
  end

  describe "basic destroy" do
    let!(:participation) { create(:participation) }

    it "updates the resource" do
      expect(ParticipationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Participation.count }.by(-1)
      expect { participation.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
