class AddMinSubscriptionToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :min_subscription, :integer, default: 0
  end
end
