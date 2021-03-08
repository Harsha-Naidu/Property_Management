class AddUserReferencesToRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :requests, :user,foreign_key: true
  end
end
