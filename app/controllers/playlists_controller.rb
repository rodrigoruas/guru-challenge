class PlaylistsController <  SecuredController
  skip_before_action :authorize_request, only: [:index]
  def index
    # current_user = @user
    playlists = Playlist.all
    render json: playlists
  end

  def show
    # current_user = @user
    playlist = Playlist.find(params[:id])
    if check_subscription?
      render json: playlist
    else
      render json: { errors: ['Not Authorized'] }, status: :unauthorized
    end
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

  def check_subscription?
    @user.subscription == playlist.min_subscription
  end

  def playlist_params
    params.permit(:name, :description)
  end
end
