class CreateSignatureConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :signature_connectors do |t|

      t.timestamps
    end
  end
end
