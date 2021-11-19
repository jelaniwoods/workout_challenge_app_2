require 'rails_helper'

RSpec.describe "privileges#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/privileges/#{privilege.id}", params: params
  end

  describe 'basic fetch' do
    let!(:privilege) { create(:privilege) }

    it 'works' do
      expect(PrivilegeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('privileges')
      expect(d.id).to eq(privilege.id)
    end
  end
end
