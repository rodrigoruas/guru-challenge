class AddMinSubscriptionToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :min_subscription, :string, default: "Basic"
  end
end
