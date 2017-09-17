class AddHighscoreToConnect < ActiveRecord::Migration[5.1]
  def change
    add_column :connects, :highscore, :integer
  end
end
