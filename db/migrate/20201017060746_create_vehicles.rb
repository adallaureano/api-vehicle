class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :marca
      t.string :veiculo
      t.integer :ano
      t.text :descricao
      t.boolean :vendido

      t.timestamps
    end
  end
end
