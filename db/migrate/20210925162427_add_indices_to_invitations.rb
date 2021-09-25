class AddIndicesToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_index :invitations, :invitee_id
    add_index :invitations, :private_event_id
    add_index :invitations, %i[private_event_id invitee_id], unique: true
  end
end
