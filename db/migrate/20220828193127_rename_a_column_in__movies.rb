class RenameAColumnInMovies < ActiveRecord::Migration[6.1]
  def change
    rename_column :movies, :in_theatres, :in_theaters
  end
end
