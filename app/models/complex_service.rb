class ComplexService < ActiveRecord::Base
	has_many :atomic_services
	has_many :services, :through => :atomic_services
	
	def opinion
		@cs_opinions=[]
		self.services.each do |atomic|
			@cs_opinions << atomic.consensus
		end
		@cs_opinions.each do |opinion|
			puts opinion.belief
			puts opinion.disbelief
			puts opinion.uncertainty
			puts "---"
		end
		@opinion = conjunction(@cs_opinions)
  end

  def self.get_opinion_about(services) #dodane
    @cs_opinions=[]
    services.each do |atomic|
      @cs_opinions << atomic.consensus
    end
    conjunction(@cs_opinions)
  end
	
	def self.conjunction(opinions)
		@conjunction = opinions.last
		opinions[0...(opinions.length-1)].each do |opinion|
			@conjunction = @conjunction.conjunction_with(opinion)
		end if (opinions.size > 1)
		@conjunction
	end
end
