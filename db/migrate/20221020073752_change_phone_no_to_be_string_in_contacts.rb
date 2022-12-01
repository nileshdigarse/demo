class ChangePhoneNoToBeStringInContacts < ActiveRecord::Migration[5.1]
  def change
    change_column :contacts, :phone_no, :string
  end
end
