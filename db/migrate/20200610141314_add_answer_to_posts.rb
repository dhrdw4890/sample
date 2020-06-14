class AddAnswerToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :answer, :string
  end
end
