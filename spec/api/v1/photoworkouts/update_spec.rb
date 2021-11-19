require "rails_helper"

RSpec.describe "photoworkouts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/photoworkouts/#{photoworkout.id}", payload
  end

  describe "basic update" do
    let!(:photoworkout) { create(:photoworkout) }

    let(:payload) do
      {
        data: {
          id: photoworkout.id.to_s,
          type: "photoworkouts",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PhotoworkoutResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { photoworkout.reload.attributes }
    end
  end
end
