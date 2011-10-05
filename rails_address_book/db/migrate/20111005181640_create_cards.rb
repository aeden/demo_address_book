class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :first_name
      t.string :last_name
      t.string :display_name

      t.timestamps
    end
  end
end
