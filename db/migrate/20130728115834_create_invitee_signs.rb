class CreateInviteeSigns < ActiveRecord::Migration
  def change
    create_table :invitee_signs do |t|
      t.references :invitee
      t.references :sign

      t.timestamps
    end
    add_index :invitee_signs, :invitee_id
    add_index :invitee_signs, :sign_id
  end
end
