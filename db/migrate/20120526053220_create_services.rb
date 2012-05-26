class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id
      t.string  :provider, :null => false, :default => ""
      t.string  :uid,      :null => false, :default => ""

      t.timestamps
    end
  end
end
