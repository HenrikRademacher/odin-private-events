class AddPrivateToEvents < ActiveRecord::Migration[8.1]
  def change
    add_column :events, :is_private, :boolean, default: false
  end
end
