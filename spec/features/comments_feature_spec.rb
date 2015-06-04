require 'rails_helper'

feature 'commenting' do

  context 'user is signed in' do
    before do
      create_post
      sign_in
    end
    scenario 'allows users to leave a comment using a form' do
      click_link 'Leave comment'
      fill_in 'comment_text', with: "Cool dogg"
      click_button 'Leave Comment'
      expect(current_path).to eq '/posts'
      expect(page).to have_content('Cool dogg')
    end
  end

  context 'user is not signed in' do
    before do
      create_post
    end
    scenario 'user cannot delete comment she did not create' do
      visit '/'
      expect(page).not_to have_content('Leave Comment')
    end
    scenario 'user cannot edit comment she did not create' do
      visit '/'
      expect(page).not_to have_content('Edit Comment')
    end
  end

  context 'another user is signed in' do
    before do
      create_post
      sign_up_alt
    end
    scenario 'user cannot delete comment she did not create' do
      visit '/'
      expect(page).not_to have_content('Leave Comment')
    end
    scenario 'user cannot edit comment she did not create' do
      visit '/'
      expect(page).not_to have_content('Edit Comment')
    end
  end
end