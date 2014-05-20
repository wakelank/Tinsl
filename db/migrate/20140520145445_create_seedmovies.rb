class CreateSeedmovies < ActiveRecord::Migration
  def change
    create_table :seedmovies do |t|
      t.string :title
      t.integer :gross
    end
  end
end
