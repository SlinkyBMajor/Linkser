class ChangeTypeName < ActiveRecord::Migration
  def change
    rename_column :sites, :type, :object_type
  end
end
