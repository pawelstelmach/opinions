class AtomicService < ActiveRecord::Base
	belongs_to :complex_service
	belongs_to :service
end
