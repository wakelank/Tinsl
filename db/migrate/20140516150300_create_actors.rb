class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :image_url
      t.integer :value
      
      t.timestamps
    end
  end
end
