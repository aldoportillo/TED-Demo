class AddViewsCountToPeople < ActiveRecord::Migration[7.2]
  def change
    add_column :people, :views_count, :integer, default: 0
  end
end
