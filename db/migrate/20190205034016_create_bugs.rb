class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.int :issue_type
      t.int :priority
      t.int :status

      t.timestamps
    end
  end
end
