class CreateTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types do |t|
      t.string :label
      t.string :handle

      t.timestamps
    end
  end
end
