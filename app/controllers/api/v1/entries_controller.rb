class Api::V1::EntriesController < ApplicationController

  def index
    @entries = Entry.all.with_attached_images
  end

  def create
    entry = Entry.create! params.require(:entry).permit(:title, :content)
    entry.images.attach(params[:entry][:images])
    redirect_to message
  end

  def show
    @entry = Entry.find(param[:id])
  end
  
end
