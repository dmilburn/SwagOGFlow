class AddSelectedColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :selected, :boolean, default: false
  end
end
