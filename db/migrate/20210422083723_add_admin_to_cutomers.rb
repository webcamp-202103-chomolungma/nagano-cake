class AddAdminToCutomers < ActiveRecord::Migration[5.2]
  def change
    add_column :custs, :admin, :boolean, default: false
  end
end
