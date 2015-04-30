class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :body, null: false
      t.references :user
      t.references :respondable, :polymorphic => true
      t.timestamps
    end
  end
end
