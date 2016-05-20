class CreateGamificationPremia < ActiveRecord::Migration
  def change
    create_table :gamification_premia do |t|
      t.string :description
      t.integer :tickets
    end
  end
end
