require 'rails_helper'

RSpec.feature "PostsAppearInReverseChronologicalOrders", type: :feature do
  scenario '3 posts appear from most recent on top' do
    user = User.create(name: "example_name", email: "example@example.com", password: "example123")
    post = Post.create(message: "The least recent", user_id: user.id)
    post = Post.create(message: "Less recent", user_id: user.id)
    post = Post.create(message: "Most recent", user_id: user.id)

    sign_up_log_in

    visit '/'
    
    posts = page.all('.post')

    expect(posts.length).to eq 3
    expect(posts[0]).to have_content 'Most recent'
    expect(posts[1]).to have_content 'Less recent'
    expect(posts[2]).to have_content 'The least recent'
  end
end
