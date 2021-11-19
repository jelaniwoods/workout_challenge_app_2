require 'rails_helper'

RSpec.describe ParticipationResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'participations',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ParticipationResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Participation.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:participation) { create(:participation) }

    let(:payload) do
      {
        data: {
          id: participation.id.to_s,
          type: 'participations',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ParticipationResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { participation.reload.updated_at }
      # .and change { participation.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:participation) { create(:participation) }

    let(:instance) do
      ParticipationResource.find(id: participation.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Participation.count }.by(-1)
    end
  end
end
