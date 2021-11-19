require "rails_helper"

RSpec.describe "privileges#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/privileges", params: params
  end

  describe "basic fetch" do
    let!(:privilege1) { create(:privilege) }
    let!(:privilege2) { create(:privilege) }

    it "works" do
      expect(PrivilegeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["privileges"])
      expect(d.map(&:id)).to match_array([privilege1.id, privilege2.id])
    end
  end
end
