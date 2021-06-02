class CreateBanana < ActiveRecord::Migration[6.1]
  def change
    create_table :banana do |t|

      t.timestamps
    end
  end
end
