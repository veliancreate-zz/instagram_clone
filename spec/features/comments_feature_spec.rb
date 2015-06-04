require 'rails_helper'

feature 'commenting' do
  before do
    create_post
    sign_in
  end

  scenario 'allows users to leave a comment using a form' do
    visit '/'
    click_link 'Leave comment'
    fill_in 'comment_text', with: "Cool dogg"
    click_button 'Leave Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('Cool dogg')
  end

end