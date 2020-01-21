class AddPasswordToTrainer < ActiveRecord::Migration[6.0]
  def change

    add_column :trainers, :password, :string
  end
end
