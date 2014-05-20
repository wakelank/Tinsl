class ActorsSeedmovies < ActiveRecord::Migration
  def change
     create_table :actors_seedmovies do |t|
      t.references :actor
      t.references :seedmovie
    end
  end
end
