class ChangeColumnDefaultToMembers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :members, :is_deleted, from: nil, to: false
  end
end
