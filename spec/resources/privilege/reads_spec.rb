require "rails_helper"

RSpec.describe PrivilegeResource, type: :resource do
  describe "serialization" do
    let!(:privilege) { create(:privilege) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(privilege.id)
      expect(data.jsonapi_type).to eq("privileges")
    end
  end

  describe "filtering" do
    let!(:privilege1) { create(:privilege) }
    let!(:privilege2) { create(:privilege) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: privilege2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([privilege2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:privilege1) { create(:privilege) }
      let!(:privilege2) { create(:privilege) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      privilege1.id,
                                      privilege2.id,
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
                                      privilege2.id,
                                      privilege1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
