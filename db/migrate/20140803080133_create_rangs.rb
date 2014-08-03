class CreateRangs < ActiveRecord::Migration
  def change
    create_table :rangs do |t|
      t.integer :nom_id, null: false
      t.float :rang_t, default: 0, null: false
      t.float :rang_f, default: 0, null: false
      t.float :rang_q, default: 0, null: false
      t.text :trace

      t.timestamps
    end
  end
end
