class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.bigint :starable_id
      t.string :starable_type
      t.timestamps
    end
    add_index :stars, [:starable_type, :starable_id]
  end
end
