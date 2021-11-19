require 'rails_helper'

RSpec.describe ChallengeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'challenges',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ChallengeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Challenge.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:challenge) { create(:challenge) }

    let(:payload) do
      {
        data: {
          id: challenge.id.to_s,
          type: 'challenges',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ChallengeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { challenge.reload.updated_at }
      # .and change { challenge.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:challenge) { create(:challenge) }

    let(:instance) do
      ChallengeResource.find(id: challenge.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Challenge.count }.by(-1)
    end
  end
end
