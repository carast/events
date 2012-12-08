class RenameLocaltionToLocationOnEvent < ActiveRecord::Migration
  def up
    rename_column :events, :localtion, :location
  end

  def down
    rename_column :events, :location, :localtion
  end
end
