require "rails_helper"

RSpec.describe PhotoworkoutResource, type: :resource do
  describe "serialization" do
    let!(:photoworkout) { create(:photoworkout) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(photoworkout.id)
      expect(data.jsonapi_type).to eq("photoworkouts")
    end
  end

  describe "filtering" do
    let!(:photoworkout1) { create(:photoworkout) }
    let!(:photoworkout2) { create(:photoworkout) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: photoworkout2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([photoworkout2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:photoworkout1) { create(:photoworkout) }
      let!(:photoworkout2) { create(:photoworkout) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      photoworkout1.id,
                                      photoworkout2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      photoworkout2.id,
                                      photoworkout1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
