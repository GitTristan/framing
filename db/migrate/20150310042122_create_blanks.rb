class CreateBlanks < ActiveRecord::Migration
  def change
    create_table :blanks do |t|
      t.string :name
      t.string :email
      t.integer :pages

    end
  end
end
