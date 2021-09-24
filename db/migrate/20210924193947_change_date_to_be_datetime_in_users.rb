class ChangeDateToBeDatetimeInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :events, :date, :datetime
  end
  def down
    change_column :events, :date, :time
  end
end
