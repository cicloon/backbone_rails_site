class AlterComingColumn < ActiveRecord::Migration
  def up
    remove_column :invitees, :coming
    add_column :invitees, :coming, :integer, :null => false, :default => 0
  end

  def down
    remove_column :invitees, :coming
    add_column :invitees, :coming, :boolean
  end
end
