class CreatePersonas < ActiveRecord::Migration
  def self.up
    create_table :personas do |t|
      t.string :full_name
      t.integer :age
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :personas
  end
end
