class AddColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :private, :boolean
    Event.update_all ['private = ?', false]
  end
end
