class CreateInvitations < ActiveRecord::Migration[8.1]
  def change
    create_table :invitations do |t|
      t.timestamps
      t.belongs_to :attended_event
      t.belongs_to :attendee
    end
  end
end
