class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.references :tipo_documento, foreign_key: true
      t.bigint :numero_documento
      t.string :apellido
      t.string :nombre
      t.references :localidad, foreign_key: true

      t.timestamps
    end
  end
end
