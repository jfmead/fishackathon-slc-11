class AddUsersTable < ActiveRecord::Migration
    def up
        create_table :users do |u|
            u.string :email
            u.string :password
            u.string :username
            u.string :reports, default: [], array: true
        end
    end
    
    def down
        drop_table :users
    end
end
