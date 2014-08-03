class CreateLeins < ActiveRecord::Migration
  def change
    create_table :leins do |t|
      t.integer :nom, null: false
      t.integer :lune, null: false
      t.integer :un_duex, null: false
      t.integer :rang_nom
      t.float :rang_t
      t.float :rang_f
      t.float :rang_q

      t.timestamps
    end
  end
end
