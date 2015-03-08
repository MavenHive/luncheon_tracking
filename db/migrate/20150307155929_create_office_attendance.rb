class CreateOfficeAttendance < ActiveRecord::Migration
  def change
    create_table :office_attendances do |t|
      t.references :user
      t.boolean :attending_office
      t.time :arriving_time

      t.timestamps
    end
  end
end
