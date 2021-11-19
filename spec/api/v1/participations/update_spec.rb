require 'rails_helper'

RSpec.describe "participations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/participations/#{participation.id}", payload
  end

  describe 'basic update' do
    let!(:participation) { create(:participation) }

    let(:payload) do
      {
        data: {
          id: participation.id.to_s,
          type: 'participations',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ParticipationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { participation.reload.attributes }
    end
  end
end
