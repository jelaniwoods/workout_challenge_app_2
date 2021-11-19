require "rails_helper"

RSpec.describe ParticipationResource, type: :resource do
  describe "serialization" do
    let!(:participation) { create(:participation) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(participation.id)
      expect(data.jsonapi_type).to eq("participations")
    end
  end

  describe "filtering" do
    let!(:participation1) { create(:participation) }
    let!(:participation2) { create(:participation) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: participation2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([participation2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:participation1) { create(:participation) }
      let!(:participation2) { create(:participation) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      participation1.id,
                                      participation2.id,
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
                                      participation2.id,
                                      participation1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
