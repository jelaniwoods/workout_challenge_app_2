require "rails_helper"

RSpec.describe PrivilegeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "privileges",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PrivilegeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Privilege.count }.by(1)
    end
  end

  describe "updating" do
    let!(:privilege) { create(:privilege) }

    let(:payload) do
      {
        data: {
          id: privilege.id.to_s,
          type: "privileges",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PrivilegeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { privilege.reload.updated_at }
      # .and change { privilege.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:privilege) { create(:privilege) }

    let(:instance) do
      PrivilegeResource.find(id: privilege.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Privilege.count }.by(-1)
    end
  end
end
