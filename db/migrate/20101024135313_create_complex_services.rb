class CreateComplexServices < ActiveRecord::Migration
  def self.up
    create_table :complex_services do |t|
      t.string :name
      t.float :belief
      t.float :disbelief
      t.float :uncertainty

      t.timestamps
    end
  end

  def self.down
    drop_table :complex_services
  end
end
