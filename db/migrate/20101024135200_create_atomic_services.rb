class CreateAtomicServices < ActiveRecord::Migration
  def self.up
    create_table :atomic_services do |t|
      t.integer :service_id
      t.integer :complex_service_id

      t.timestamps
    end
  end

  def self.down
    drop_table :atomic_services
  end
end
