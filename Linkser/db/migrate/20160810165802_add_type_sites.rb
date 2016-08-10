class AddTypeSites < ActiveRecord::Migration
  def change
    change_table :sites do |t|
      t.string :type
    end
  end
end
