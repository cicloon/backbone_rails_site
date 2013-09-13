class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.text :body

      t.timestamps
    end
  end
end
