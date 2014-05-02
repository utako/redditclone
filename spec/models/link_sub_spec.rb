require 'spec_helper'

describe LinkSub do
  # subject(:link_sub) { create(:link_sub) }

  describe "validations" do
    it { should validate_presence_of(:link_id) }
    it { should validate_presence_of(:sub_id) }
  end

  it { should belong_to(:sub) }
  it { should belong_to(:link) }


end