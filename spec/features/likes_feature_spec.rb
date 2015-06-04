require 'rails_helper'

feature 'liking posts', js: true  do
  before do
    create_post
    sign_in
  end

  scenario 'a user can like a post, which updates the like count' do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'a user cannot like a post if she has already liked it' do
    visit '/'
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content("1 like")
  end

end