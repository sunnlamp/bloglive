class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :username
    end
  end
end
