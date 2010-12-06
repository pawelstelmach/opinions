class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.integer :agent_id
      t.integer :service_id
      t.float :belief
      t.float :disbelief
      t.float :uncertainty

      t.timestamps
    end
  end

  def self.down
    drop_table :opinions
  end
end
