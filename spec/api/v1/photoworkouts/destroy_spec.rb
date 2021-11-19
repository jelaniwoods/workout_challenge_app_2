require 'rails_helper'

RSpec.describe "photoworkouts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/photoworkouts/#{photoworkout.id}"
  end

  describe 'basic destroy' do
    let!(:photoworkout) { create(:photoworkout) }

    it 'updates the resource' do
      expect(PhotoworkoutResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Photoworkout.count }.by(-1)
      expect { photoworkout.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
