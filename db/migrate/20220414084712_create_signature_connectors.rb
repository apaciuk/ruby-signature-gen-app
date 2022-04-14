class CreateSignatureConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :signature_connectors do |t|
      t.integer :connection_type, default: 0, null: false

      t.timestamps
    end
  end
end
