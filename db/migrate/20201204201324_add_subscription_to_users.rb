class AddSubscriptionToUsers< ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subscription, :string, default: "Basic"
  end
end
