require 'rails_helper'

RSpec.describe ImageGenerator do
  describe 'generate' do
    let(:prompt) { create(:prompt) }
    let(:images) { ImageGenerator.generate(prompt) }

    it 'returns the correct response' do
      expect(images).to be_kind_of(Hash)
      expect(images).to have_key(:data)
      expect(images[:data].length).to eq prompt.number_images
    end
  end
end
