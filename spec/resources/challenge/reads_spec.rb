require "rails_helper"

RSpec.describe ChallengeResource, type: :resource do
  describe "serialization" do
    let!(:challenge) { create(:challenge) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(challenge.id)
      expect(data.jsonapi_type).to eq("challenges")
    end
  end

  describe "filtering" do
    let!(:challenge1) { create(:challenge) }
    let!(:challenge2) { create(:challenge) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: challenge2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([challenge2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:challenge1) { create(:challenge) }
      let!(:challenge2) { create(:challenge) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      challenge1.id,
                                      challenge2.id,
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
                                      challenge2.id,
                                      challenge1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
