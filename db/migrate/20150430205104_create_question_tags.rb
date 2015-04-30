class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.references :question, null: false
      t.references :tag, null: false
      t.timestamps
    end
  end
end
