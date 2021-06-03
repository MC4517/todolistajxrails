class AddReadToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :lu, :boolean
  end
end
