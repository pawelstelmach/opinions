class Service < ActiveRecord::Base
	has_many :opinions
	has_many :atomic_services
	has_many :complex_services, :through => :atomic_services
	
	def consensus
		@opinions = self.opinions
		@consensus = @opinions.last.recommend
		@opinions[0...(@opinions.length-1)].each do |opinion|
				@consensus = consensus_of_two(@consensus, opinion.recommend)
		end if (@opinions.size > 1)
		@consensus
	end
	
	def consensus_of_two(first, second)
		@k = first.uncertainty + second.uncertainty - first.uncertainty*second.uncertainty
		Opinion.new(:belief=> ((first.belief*second.uncertainty+second.belief*first.uncertainty)/@k), :disbelief=>((first.disbelief*second.uncertainty+second.disbelief*first.uncertainty)/@k), :uncertainty=>(first.uncertainty*second.uncertainty)/@k)
	end
end
