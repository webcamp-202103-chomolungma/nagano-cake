class AddRememberableToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :rememberable, :datetime
  end
end
