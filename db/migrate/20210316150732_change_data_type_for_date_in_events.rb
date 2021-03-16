class ChangeDataTypeForDateInEvents < ActiveRecord::Migration[6.1]
  def change
    change_table :events do |t|
      t.change :date, :date
    end
  end
end
