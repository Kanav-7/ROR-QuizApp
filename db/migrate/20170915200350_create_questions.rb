class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :op1
      t.string :op2
      t.string :op3
      t.string :op4
      t.integer :ans1
      t.string :subgenre
      t.integer :quiz_type

      t.timestamps
    end
  end
end
