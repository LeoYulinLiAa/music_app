class AlbumsController < ApplicationController
  
  def create
    album = Album.new(album_params)
    if album.save
      redirect_to album_url(album)
    else
      flash.now[:error] = album.errors.full_messages
      render :new
    end
  end

  def new
    @album = Album.new
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:error] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to albums_url
  end

  def album_params
    params.require(:album).permit(:band_id, :title, :year, :is_live)
  end

end
