class CreateShippingCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_charges do |t|

      t.timestamps
    end
  end
end
