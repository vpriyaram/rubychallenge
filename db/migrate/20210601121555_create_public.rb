class CreatePublic < ActiveRecord::Migration[6.1]
  def change
    create_table :public do |t|

      t.timestamps
    end
  end
end
