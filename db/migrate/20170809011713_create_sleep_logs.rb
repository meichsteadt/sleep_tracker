class CreateSleepLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :sleep_logs do |t|
      t.integer :user_id
      t.time :bed_time
      t.integer :time_to_sleep
      t.integer :times_woken_up
      t.integer :length_of_awakening
      t.time :time_woken_up_for_good
      t.integer :rest_level

      t.timestamps
    end
  end
end
