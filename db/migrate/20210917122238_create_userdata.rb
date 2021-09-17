class CreateUserdata < ActiveRecord::Migration[6.1]
  def change
    create_table :userdata do |t|
      t.string :fullname
      t.string :dob
      t.string :vaccination
      t.string :gender
      t.string :bloodgroup

      t.timestamps
    end
  end
end
