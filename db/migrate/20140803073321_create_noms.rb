class CreateNoms < ActiveRecord::Migration
  def change
    create_table :noms do |t|
      t.string :nom

      t.timestamps
    end
  end
end
