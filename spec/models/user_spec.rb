require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with name, email, and password" do
    # user = User.new(
    #   name: "test",
    #   email: "test@example.com",
    #   password: "test1234",
    # )
    expect(FactoryBot.build(:user)).to be_valid
  end
  it "is invalid without name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  it "is invalid without email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it "is invalid with a duplicate name" do
    # User.create(
    #   name: "test",
    #   email: "test@example.com",
    #   password: "test1234",
    # )
    # user = User.new(
    #   name: "test",
    #   email: "test2@example.com",
    #   password: "test1234",
    # )
    FactoryBot.create(:user, name: "test1", email: "test1@example.com")
    user = FactoryBot.build(:user, name: "test1", email: "test2@example.com")
    user.valid?
    expect(user.errors[:name]).to include("has already been taken")
  end
  it "is invalid with a duplicate email address" do
    # User.create(
    #   name: "test",
    #   email: "test@example.com",
    #   password: "test1234",
    # )
    # user = User.new(
    #   name: "test2",
    #   email: "test@example.com",
    #   password: "test1234",
    # )
    FactoryBot.create(:user, name: "test1", email: "test1@example.com")
    user = FactoryBot.build(:user, name: "test2", email: "test1@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
