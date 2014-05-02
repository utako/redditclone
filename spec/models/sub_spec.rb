require 'spec_helper'

describe Sub do
  subject(:sub) { build(:sub) }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:moderator) }
  end

  it { should belong_to(:moderator).class_name('User') }
  it { should have_many(:link_subs).class_name('LinkSub') }

end
#
# feature "Create New Sub" do
#   before :each do
#     visit "/users/new"
#   end
#
#   describe "new sub page" do
#     sign_up_as_hello_world
#     visit '/subs/new'
#     page.should have_content 'Name'
#     page.should have_content 'Links'
#   end
#
#   describe "can create new sub by filling out all fields" do
#     sign_up_as_hello_world
#     create_new_sub_with_five_links
#
#     page.should have_content "cute animals"
#     page.should have_content "Cats on Money"
#   end
#
#   describe "can create new sub without filling all fields" do
#     sign_up_as_hello_world
#     visit "/subs/new"
#     fill_in "Name", with: 'awww'
#     fill_in "Link0url", with: "http://www.reddit.com"
#     fill_in "Link0title", with: "second best site ever"
#     fill_in "Link0body", with: ""
#     fill_in "Link1url", with: "http://www.goggle.com"
#     fill_in "Link1title", with: "best site evevarrrrr"
#     fill_in "Link1body", with: ""
#
#
#     click_button "Create Sub"
#
#     page.should have_content "second best site ever"
#     page.should have_content "best site evevarrrrr"
#   end
#
# end
#
# feature "Edit Sub" do
#   before :each do
#     visit "/users/new"
#     sign_up_as_hello_world
#     create_new_sub_with_five_links
#     visit "/subs"
#   end
#
#   it "has a link on subs index to edit sub" do
#     page.should have_content 'Edit Sub'
#   end
#
#   it "shows a form to edit the sub" do
#     click_link "Edit Sub"
#     page.should have_content 'Name'
#     page.should have_content 'Links'
#   end
#
#   it "has all the data pre-filled" do
#     click_link 'Edit Sub'
#     find_field('Name').value.should eq 'awww'
#     find_field('Link0title').value.should eq 'second best site ever'
#   end
#
#   it "shows errors if editing fails" do
#     click_link 'Edit Sub'
#     fill_in 'Name', with: ''
#     click_button 'Update Sub'
#     page.should have_content "Edit Sub"
#     page.should have_content "Name can't be blank"
#   end
#
#   context "on successful update" do
#     before :each do
#       click_link 'Edit Sub'
#     end
#
#     it "redirects to the subs show page" do
#       fill_in 'Name', with: 'DuckDuckGo'
#       click_button 'Update Sub'
#       page.should have_content 'DuckDuckGo'
#     end
#   end
#
# end