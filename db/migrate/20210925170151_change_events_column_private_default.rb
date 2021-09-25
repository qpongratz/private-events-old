class ChangeEventsColumnPrivateDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :events, :private, false
  end
end
