class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
			t.string :slug, unique: true
      t.string :description
      t.references :user, index: true
      t.boolean :public, default: true
      t.string :website, default: nil
      t.string :source, default: nil

      t.timestamps null: false
    end
    add_foreign_key :projects, :users
  end
end
