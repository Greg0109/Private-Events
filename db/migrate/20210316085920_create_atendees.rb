class CreateAtendees < ActiveRecord::Migration[6.1]
  def change
    create_table :atendees do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
