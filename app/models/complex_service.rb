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

  def self.get_opinion_about(services) #nowa wersja dodane
    @cs_opinions=[]    
    services.each do |atomic|
      @cs_opinions << { "service_opinion" => atomic["service"].consensus, "id" => atomic["functionalityID"], "child" => atomic["functionalityChild"] }
    end
    reasonable_conjunction(@cs_opinions)
  end
  
  def self.reasonable_conjunction(opinions)
    #@conjunction = opinions.last
    opinion_values = Array.new
    opinions.each do |op1|
      opinions.each do |op2|
        if op1["child"]==op2["id"]
          opinion_values << op1["service_opinion"].conjunction_with(op2["service_opinion"])
        end
      end
    end
    find_worst_opinion(opinion_values)
  end
  
  def self.find_worst_opinion(opinion_values)
    worst_opinion = opinion_values.first
    opinion_values.each do |opinion|
      puts opinion.belief
      worst_opinion = worst_opinion.belief > opinion.belief ? opinion : worst_opinion
    end
    worst_opinion
  end

  
  def self.get_opinion_about_OLD(services) #dodane
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
