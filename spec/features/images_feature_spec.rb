require 'rails_helper'

feature 'images' do 
  context 'no images have been added' do 
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content('No images added yet')
      expect(page).to have_link('Add an image')
    end
  end 

  context 'images have been added' do 
    before do 
      Image.create(title: "Me with my dog")
    end  

    scenario 'display images' do 
      visit '/images'
      expect(page).to have_content('Me with my dog')
      expect(page).not_to have_content('No images added yet')
    end   

  end 

end  