class CreateInvitees < ActiveRecord::Migration
  def up
    create_table(:invitees) do |t|
      t.string :name, :null => false
      t.boolean :coming
      t.boolean :can_be_child
      t.boolean :adult_menu
      t.belongs_to :user
    end
  end

  def down
    drop_table :invitees
  end
end
