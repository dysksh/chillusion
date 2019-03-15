require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with user, work, and content" do
    # user = User.create(
    #   name: "test",
    #   email: "test@example.com",
    #   password: "test1234",
    # )
    # work = user.works.create(
    #   title: "Test Work",
    # )
    # comment = Comment.new(
    #   user: user,
    #   work: work,
    #   content: "Test Content",
    # )
    comment = FactoryBot.build(:comment)
    puts "This comment's work is #{comment.work.inspect}"
    puts "This comment's user is #{comment.user.inspect}"
    expect(comment).to be_valid
  end
  it "is invalid without content" do
    # user = User.create(
    #   name: "test",
    #   email: "test@example.com",
    #   password: "test1234",
    # )
    # work = user.works.create(
    #   title: "Test Work",
    # )
    # comment = Comment.new(
    #   user: user,
    #   work: work,
    #   content: nil,
    # )
    comment = FactoryBot.build(:comment, content: nil)
    puts "This comment's work is #{comment.work.inspect}"
    puts "This comment's user is #{comment.user.inspect}"
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end
end
