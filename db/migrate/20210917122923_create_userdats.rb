class CreateUserdats < ActiveRecord::Migration[6.1]
  def change
    create_table :userdats do |t|
      t.string :fullname
      t.string :dob
      t.string :vaccination
      t.text :gender
      t.text :bloodgroup

      t.timestamps
    end
  end
end
