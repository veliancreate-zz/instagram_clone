require 'rails_helper'

feature 'Posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/'
      expect(page).to have_content('No posts added yet')
      expect(page).not_to have_link('Add a post')
    end
  end

  context 'posts have been added' do
    before do
      create_post
      sign_in
    end
    scenario 'display posts' do
      expect(page).to have_content('Me with my dog')
      expect(page).not_to have_content('No posts added yet')
    end
    scenario 'let a user edit a post' do
      click_link 'Edit post'
      fill_in 'Title', with: 'My dog'
      click_button 'Update Post'
      expect(page).to have_content 'My dog'
      expect(current_path).to eq '/posts'
    end
    scenario 'let a user delete a post' do
      click_link 'Delete post'
      expect(page).not_to have_content 'Me with my dog'
    end
  end

  context 'prompts user to fill out a form then displays new post' do
    scenario 'display posts' do
      sign_up
      click_link('Add a post')
      fill_in 'Title', with: 'Me with my dog'
      fill_in 'Description', with: 'My best friend'
      click_button 'Create Post'
      expect(page).to have_content('Me with my dog')
      expect(current_path).to eq '/posts'
    end
  end
end