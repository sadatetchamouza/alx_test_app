require 'rails_helper'

feature 'Image Generation' do
  scenario 'generate an image' do
    visit root_path

    expect(page).to have_field("prompt")
    expect(page).to have_field("image_number")
    expect(page).to have_field("image_size")

    expect{
      fill_in 'prompt', with: 'a white siamese cat'
      fill_in 'image_number', with: '2'
      page.select '512x512', from: 'image_size'
      click_button "Submit"
    }.to change(Prompt, :count).by(1)

    expect(current_path).to eq images_generation_path(Prompt.last)
    expect(page).to have_content 'a white siamese cat'
    expect(page).to have_content '2'
    expect(page).to have_content '512x512'
    expect(page).to have_css "img", :count => Prompt.last.number_images
  end
end