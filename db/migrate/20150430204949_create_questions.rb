class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :answered, default: false
      t.references :user
      t.timestamps

    end
  end
end
