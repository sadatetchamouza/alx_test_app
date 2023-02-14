class ImagesGenerationController < ApplicationController

  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = Prompt.create!(prompt_params)
    images = ImageGenerator.generate(@prompt)[:data]
    images&.each do |image|
      @prompt.outputs.create!(url: image[:url])
    end

    redirect_to images_generation_path(@prompt)
  end

  def show
    @prompt = Prompt.includes(:outputs).find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @prompt.to_json(include: :outputs) }
    end
  end

  private
  def prompt_params
    params.require(:prompt).permit(:prompt, :number_images, :size)
  end
end
