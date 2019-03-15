require 'rails_helper'

RSpec.describe Work, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with user and title" do
    # user = User.create(
    #   name: "test",
    #   email: "test@example.com",
    #   password: "test1234",
    # )
    # work = user.works.create(
    #   title: "Test Work",
    # )
    work = FactoryBot.build(:work)
    expect(work).to be_valid
  end
  it "is invalid without title" do
    # user = User.create(
    #   name: "test",
    #   email: "test@example.com",
    #   password: "test1234",
    # )
    # work = user.works.create(
    #   title: nil,
    # )
    work = FactoryBot.build(:work, title: nil)
    work.valid?
    expect(work.errors[:title]).to include("can't be blank")
  end
  it "can have many comments" do
    work = FactoryBot.create(:work, :with_comments)
    expect(work.comments.length).to eq 5
  end
end
