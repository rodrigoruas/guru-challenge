class PlaylistsController <  SecuredController
  skip_before_action :authorize_request, only: [:index]
  def index
    current_user = @user
    playlists = Playlist.all
    render json: playlists
  end

  def show
    current_user = @user
    playlist = Playlist.find(params[:id])
    render json: playlist
    rescue ActiveRecord::RecordNotFound
      head :not_found
  end

  def create
    playlist = Playlist.create!(playlist_params)
    render json: playlist, status: :created
  end

  def destroy
    playlist = Playlist.find(params[:id])
    playlist.delete
    head :no_content
  end

  private

  def playlist_params
    params.permit(:name, :description)
  end
end
