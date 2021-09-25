# frozen_string_literal: true

class ChangeDateToBeDatetimeInUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :events, :date, :time
    add_column :events, :date, :datetime
  end
  def down
    remove_column :events, :date, :datetime
    add_column :events, :date, :time
  end
end
