class AddPasswordDigestToTrainer < ActiveRecord::Migration[6.0]
  def change

    add_column :trainers, :password_digest, :string
  end
end
