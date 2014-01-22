class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.string :description
      t.datetime :sent_at

      t.timestamps
    end
  end
end
