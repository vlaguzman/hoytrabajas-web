class CreateFunction < ActiveRecord::Migration[6.0]
  def change
    create_table :functions do |t|
      t.string :description
      t.timestamps
    end
  end
end