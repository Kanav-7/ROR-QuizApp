class CreateConnects < ActiveRecord::Migration[5.1]
  def change
    create_table :connects do |t|
      t.references :user, foreign_key: true
      t.integer :quiz
      t.integer :state
      t.integer :score

      t.timestamps
    end
  end
end
