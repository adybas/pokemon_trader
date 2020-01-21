class AddImageHpToCard < ActiveRecord::Migration[6.0]
  def change

    add_column :cards, :hp, :string
    add_column :cards, :national_pokedex_number, :integer
    add_column :cards, :rarity, :string
    add_column :cards, :evolves_from, :string
  end
end
