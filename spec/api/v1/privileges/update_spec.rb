require 'rails_helper'

RSpec.describe "privileges#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/privileges/#{privilege.id}", payload
  end

  describe 'basic update' do
    let!(:privilege) { create(:privilege) }

    let(:payload) do
      {
        data: {
          id: privilege.id.to_s,
          type: 'privileges',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PrivilegeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { privilege.reload.attributes }
    end
  end
end
