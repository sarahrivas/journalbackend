class Api::V1::EntriesController < ApplicationController
  before_action :set_entry, only: [:show,:update,:destroy]
  before_action :set_storage_url, only: [:create, :show]

  def index
    @entries = Entry.all
    render json: @entries, status: 200
  end

  def create
    @entry = Entry.create(entry_params)
    # entry.images.attach(params[:entry][:images])
    # redirect_to message
    render json: {
      title: @entry.title,
      url: @entry.image.service_url,
      content: @entry.content,
      user_id: @entry.user_id
    }, status: 200
  end

  def update
    @entry.update(entry_params)
    render json: @entry, status: 200
  end

  def show
    @entry = Entry.find(params[:id])
    render json: {
      title: @entry.title,
      url: @entry.image.service_url,
      content: @entry.content,
      user_id: @entry.user.id
      }, status: 200
  end

  def destroy
    entryId = @entry.id
    @entry.destroy
    render json: {message: "Your journal entry has been deleted!", entryId:entryId}
  end

private
    def entry_params
      params.permit(:title, :content, :user_id, :image)
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def set_storage_url
      ActiveStorage::Current.host = request.base_url
    end
end
