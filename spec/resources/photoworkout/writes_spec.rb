require "rails_helper"

RSpec.describe PhotoworkoutResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "photoworkouts",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PhotoworkoutResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Photoworkout.count }.by(1)
    end
  end

  describe "updating" do
    let!(:photoworkout) { create(:photoworkout) }

    let(:payload) do
      {
        data: {
          id: photoworkout.id.to_s,
          type: "photoworkouts",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PhotoworkoutResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { photoworkout.reload.updated_at }
      # .and change { photoworkout.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:photoworkout) { create(:photoworkout) }

    let(:instance) do
      PhotoworkoutResource.find(id: photoworkout.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Photoworkout.count }.by(-1)
    end
  end
end
