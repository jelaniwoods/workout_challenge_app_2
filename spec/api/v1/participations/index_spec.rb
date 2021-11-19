require 'rails_helper'

RSpec.describe "participations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/participations", params: params
  end

  describe 'basic fetch' do
    let!(:participation1) { create(:participation) }
    let!(:participation2) { create(:participation) }

    it 'works' do
      expect(ParticipationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['participations'])
      expect(d.map(&:id)).to match_array([participation1.id, participation2.id])
    end
  end
end
