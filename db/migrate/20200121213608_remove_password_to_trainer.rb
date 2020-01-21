class RemovePasswordToTrainer < ActiveRecord::Migration[6.0]
  def change

    remove_column :trainers, :password, :string 
  end
end
