require 'rails_helper'

RSpec.describe Team, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:challenge) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
