require 'rails_helper'

RSpec.describe Challenge, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:photos) }

    it { should have_many(:participations) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
