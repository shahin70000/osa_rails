class CreateLeins < ActiveRecord::Migration
  def change
    create_table :leins do |t|
      t.integer :nom_id, null: false
      t.integer :lune_id, null: false
      t.integer :un_duex_id, null: false
      t.integer :rang_nom_id
      t.float :rang_t
      t.float :rang_f
      t.float :rang_q

      t.timestamps
    end
  end
end
