require 'rails_helper'

RSpec.describe Comment, type: :model do
	let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
	let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let (:comment) { Comment.create!(body: 'Comment Body', commentable: post, user: user) }

  it { is_expected.to belong_to(:commentable) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(5) }

	describe "attributes" do
		it "has a body attribute" do
			expect(comment).to have_attributes(body: "Comment Body")
		end
	end

	describe 'polymorphic commentable' do
		it 'can belong to a topic' do
			comment = topic.comments.create(body: 'blahbllahablaha')
			expect(comment.commentable).to eq(topic)
		end

		it 'can belong to a post' do
			comment = post.comments.create(body: 'blahbllahablaha')
			expect(comment.commentable).to eq(post)
		end
	end
end
