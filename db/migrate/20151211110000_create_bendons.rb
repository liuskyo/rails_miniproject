class CreateBendons < ActiveRecord::Migration
  def change
    create_table :bendons do |t|
      t.stringaddress :store
      t.string :phone_number
      t.text :description

      t.timestamps null: false
    end
  end
end
