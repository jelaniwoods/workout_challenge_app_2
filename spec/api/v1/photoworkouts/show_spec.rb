require 'rails_helper'

RSpec.describe "photoworkouts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/photoworkouts/#{photoworkout.id}", params: params
  end

  describe 'basic fetch' do
    let!(:photoworkout) { create(:photoworkout) }

    it 'works' do
      expect(PhotoworkoutResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('photoworkouts')
      expect(d.id).to eq(photoworkout.id)
    end
  end
end
