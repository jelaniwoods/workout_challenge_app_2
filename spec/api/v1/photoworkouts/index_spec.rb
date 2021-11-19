require "rails_helper"

RSpec.describe "photoworkouts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/photoworkouts", params: params
  end

  describe "basic fetch" do
    let!(:photoworkout1) { create(:photoworkout) }
    let!(:photoworkout2) { create(:photoworkout) }

    it "works" do
      expect(PhotoworkoutResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["photoworkouts"])
      expect(d.map(&:id)).to match_array([photoworkout1.id, photoworkout2.id])
    end
  end
end
