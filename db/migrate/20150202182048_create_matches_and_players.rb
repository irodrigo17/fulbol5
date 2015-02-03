class CreateMatchesAndPlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name # TODO: add not-null constraint
      t.string :email # TODO: add not-null constraint
      t.timestamps null: false
    end

    create_table :matches do |t|
      t.datetime :date # TODO: add not-null constraint
      t.string :place # TODO: add not-null constraint
      t.timestamps null: false
    end

    create_table :match_players do |t|
      t.references :match, index: true
      t.references :player, index: true

      t.timestamps null: false
    end
    add_foreign_key :match_players, :matches
    add_foreign_key :match_players, :players

  end
end
