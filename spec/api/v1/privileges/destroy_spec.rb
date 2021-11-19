require "rails_helper"

RSpec.describe "privileges#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/privileges/#{privilege.id}"
  end

  describe "basic destroy" do
    let!(:privilege) { create(:privilege) }

    it "updates the resource" do
      expect(PrivilegeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Privilege.count }.by(-1)
      expect { privilege.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
