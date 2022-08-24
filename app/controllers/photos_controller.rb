class PhotosController < ApplicationController
  def index
    @photos = Photo.all.with_attached_image
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    
    if @photo.save
      flash[:success] = "Image Saved"
      redirect_to photos_path
    else
      flash.now[:warn] = "Image didn't save"
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:warn] = "Image Deleted"
      redirect_to photos_path
    else
      flash[:warn] = "Image Deleted"
      render :show
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @photo_ids = Photo.all.ids

    unless @photo_ids.find_index(@photo.id) == @photo_ids.length - 1
      @next_photo_id = @photo_ids[@photo_ids.find_index(@photo.id) + 1]
    end

    unless @photo_ids.find_index(@photo.id) == 0
      @previous_photo_id = @photo_ids[@photo_ids.find_index(@photo.id) - 1]
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :descritption, :image)
  end

end
