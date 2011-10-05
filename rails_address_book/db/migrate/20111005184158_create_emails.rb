class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :card
      t.string :address_type
      t.string :address

      t.timestamps
    end
  end
end
