class CreateRangs < ActiveRecord::Migration
  def change
    create_table :rangs do |t|
      t.integer :nom, null: false
      t.float :rang_t, default: 0, null: false
      t.float :rang_f, default: 0, null: false
      t.float :rang_q, default: 0, null: false
      t.integer :rang_nom
      t.text :trace

      t.timestamps
    end
  end
end
