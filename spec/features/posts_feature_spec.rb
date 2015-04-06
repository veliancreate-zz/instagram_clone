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

end  