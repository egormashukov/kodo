class CreateInvitations < ActiveRecord::Migration
  def up
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.boolean :available, default: true

      t.timestamps
    end
  end

  def down
    drop_table :invitations
  end
end
