class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :user, index: true
      t.string :title
      t.text :content
      t.string :token

      t.timestamps
    end
  end
end
