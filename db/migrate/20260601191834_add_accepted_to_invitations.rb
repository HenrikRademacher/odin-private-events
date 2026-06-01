class AddAcceptedToInvitations < ActiveRecord::Migration[8.1]
  def change
    add_column :invitations, :accepted, :boolean, default: false
  end
end
