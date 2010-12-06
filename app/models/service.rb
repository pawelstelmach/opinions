class Service < ActiveResource::Base
	self.site = "http://#{APP_CONFIG['services_url']}/"
	self.timeout = 1.hour
  
  def consensus
    @opinions = Opinion.find(:all, :conditions => {:service_id => self.id})
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