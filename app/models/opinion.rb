class Opinion < ActiveRecord::Base

	belongs_to :agent
	belongs_to :service
	
	def recommend
		@agent = self.agent
		#<bA*bS, bA*dS, dA + uA + bA*uS>
		@recommendation = Opinion.new(:belief=> @agent.belief*self.belief, :disbelief=>@agent.belief*self.disbelief, :uncertainty=>(@agent.disbelief + @agent.uncertainty + @agent.belief*self.uncertainty))
	end
	
	def conjunction_with(other)
		Opinion.new(:belief=> (self.belief*other.belief), :disbelief=>(self.disbelief+other.disbelief-self.disbelief*other.disbelief), :uncertainty=>(self.belief*other.uncertainty+self.uncertainty*other.belief+self.uncertainty*other.uncertainty))
	end
end
