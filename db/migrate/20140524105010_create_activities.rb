class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.decimal :distance
      t.decimal :duration
      t.date :date
      t.string :comment

      t.timestamps
    end
  end
end
