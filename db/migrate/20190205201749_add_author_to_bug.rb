class AddAuthorToBug < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :author, foreign_key: true
  end
end
