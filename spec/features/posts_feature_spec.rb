require 'rails_helper'

feature 'Posts' do 
  context 'no posts have been added' do 
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts added yet')
      expect(page).to have_link('Add a post')
    end
  end 

  context 'posts have been added' do 
    before do 
      Post.create(title: "Me with my dog")
    end  

    scenario 'display posts' do 
      visit '/posts'
      expect(page).to have_content('Me with my dog')
      expect(page).not_to have_content('No posts added yet')
    end   

  end 

  context 'prompts user to fill out a form then displays new post' do 
    scenario 'display posts' do 
      visit '/posts'
      click_link('Add a post')
      fill_in 'Title', with: 'Me with my dog'
      fill_in 'Description', with: 'My best friend'
      click_button 'Create restaurant'
      expect(page).to have_content('Me with my dog')
      expect(current_path).to eq '/posts'
    end  
  end  

end  