class AddSubscriptionToUsers< ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subscription, :integer, default: 0
  end
end
