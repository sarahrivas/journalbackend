class Api::V1::EntriesController < ApplicationController
  before_action :set_entry, only: [:show,:update,:destroy]

  def index
    @entries = Entry.all.with_attached_images
    render json: @entries, status: 200
  end

  def create
    entry = Entry.create! params.require(:entry).permit(:title, :content, :user_id)
    # entry.images.attach(params[:entry][:images])
    # redirect_to message
    render json: entry, status: 201
  end

  def update
    @entry.update(entry_params)
    render json: @entry, status: 200
  end

  def show
    render json: @entry, status: 200
  end

  def destroy
    entryId = @entry.id
    @entry.destroy
    render json: {message: "Your journal entry has been deleted!", entryId:entryId}
  end

private
    def entry_params
      params.permit(:title, :content, :user_id)
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end

end
