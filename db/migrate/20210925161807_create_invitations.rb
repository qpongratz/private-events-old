class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :private_event_id
      t.integer :invitee_id

      t.timestamps
    end
  end
end
