class ImagesGenerationController < ApplicationController

  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = Prompt.create!(prompt_params)
    redirect_to images_generation_path(@prompt)
  end

  def show
    @prompt = Prompt.find(params[:id])
    ImageGenerator.generate(@prompt)[:data].each do |image|
      @prompt.outputs.create!(url: image[:url])
    end
  end

  private
  def prompt_params
    params.require(:prompt).permit(:prompt, :number_images, :size)
  end
end
