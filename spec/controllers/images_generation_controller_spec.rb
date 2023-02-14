require 'rails_helper'

RSpec.describe ImagesGenerationController do
  describe "GET #new" do
    it 'assigns a new prompt to @prompt' do
      get :new

      expect(assigns(:prompt)).to be_a_new(Prompt)
    end
    it 'renders the new template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    before :each do
      @prompt = create(:prompt)
    end

    it 'assigns the requested prompt to @prompt' do
      get :show, params: { id: @prompt.id }

      expect(assigns(:prompt)).to eq @prompt
    end

    it 'renders the show template' do
      get :show, params: { id: @prompt.id }

      expect(response).to render_template(:show)
    end
  end
end
