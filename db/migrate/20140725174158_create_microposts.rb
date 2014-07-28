class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.references :user, index: true

      t.timestamps
    end

    add_index :microposts, :created_at
  end
end
