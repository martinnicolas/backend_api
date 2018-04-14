class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.integer :dni
      t.string :apellido
      t.string :nombre

      t.timestamps
    end
  end
end
