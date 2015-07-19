class AlbumsController < ApplicationController
  before_action :require_signed_in!

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    @band = @album.band
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    bandid = @album.band_id
    @album.destroy
    redirect_to band_url(bandid)
  end

  def album_params
    params.require(:album).permit(:band_id, :title, :recording_type)
  end
end
