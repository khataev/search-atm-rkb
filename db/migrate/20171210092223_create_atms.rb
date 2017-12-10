class CreateAtms < ActiveRecord::Migration[5.1]
  def change
    create_table :atms do |t|
      t.string :name
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
