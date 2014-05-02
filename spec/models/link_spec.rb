require 'spec_helper'

describe Link do
  subject(:link) { build(:link) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
  end

  it { should have_many(:link_subs).class_name('LinkSub') }
  it { should have_many(:comments) }


end
