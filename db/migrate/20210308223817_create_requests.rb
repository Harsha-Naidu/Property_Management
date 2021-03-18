class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :suit_no
      t.string :name
      t.string :request_type
      t.string :request_status
      t.string :contact_phone
      t.string :email
      t.text :additional_notes

      t.timestamps
    end
  end
end
