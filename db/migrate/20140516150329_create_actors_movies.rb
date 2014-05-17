class CreateActorsMovies < ActiveRecord::Migration
  def change
    create_table :actors_movies do |t|
      t.references :actor
      t.references :movie
    end
  end
end
