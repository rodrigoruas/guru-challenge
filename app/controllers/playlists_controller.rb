class PlaylistsController <  SecuredController
  skip_before_action :authorize_request, only: [:index]
  def index
    playlists = Playlist.all
    render json: playlists, include: [sections: {include: :videos}]
  end

  def show
    @playlist = Playlist.find(params[:id])
    if @user.subscription >= @playlist.min_subscription
      render json: @playlist, include: [sections: {include: :videos}]
    else
      render json: { errors: ['Not Authorized'] }, status: :unauthorized
    end
    rescue ActiveRecord::RecordNotFound
      render json: { errors: ['Playlist does not exist'] }, status: :not_found
  end

  private

  def playlist_params
    params.permit(:name, :description)
  end
end


