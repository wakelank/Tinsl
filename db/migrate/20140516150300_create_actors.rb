class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :image_url
      t.integer :value, :limit => 8
      
      t.timestamps
    end
  end
end
