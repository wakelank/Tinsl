class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :tagline
      t.references :user
      t.timestamps
    end
  end
end
