class OpinionController < ApplicationController
  wsdl_service_name 'Opinion'
  web_service_api OpinionApi
  web_service_scaffold :invocation if Rails.env == 'development'

  def get_opinion(xml)
    atomic_service_array = Hash.from_xml(xml)['services'].to_a
    #atomic_service_array = Hash.from_xml("<?xml version=\"1.0\" encoding=\"UTF-8\"?><services><service><id>1</id></service><service><id>2</id></service><service><id>3</id></service></services>")['services']['service'].to_a.flatten
    print "!!! "
    print xml
    print " !!!"
    complex_service = Array.new
    atomic_service_array.each do |item|
      complex_service << {"service" => Service.find(item["id"]), "functionalityID" => item["functionalityID"], "functionalityChild" => item["functionalityChild"]}
    end
       
    opinion = ComplexService.get_opinion_about(complex_service)
    
    result = ""
    xml_build = Builder::XmlMarkup.new(:target => result, :ident => 2 )
    xml_build.instruct! 
    xml_build.opinion {
      xml_build.belief(opinion.belief)
      xml_build.disbelief(opinion.disbelief)
      xml_build.uncertainty(opinion.uncertainty)
    }
    return result
  end
  
    def xsd_test(xml)
    atomic_service_array = Hash.from_xml(xml)['services'].to_a
    #atomic_service_array = Hash.from_xml("<?xml version=\"1.0\" encoding=\"UTF-8\"?><services><service><id>1</id></service><service><id>2</id></service><service><id>3</id></service></services>")['services']['service'].to_a.flatten
    print "!!! "
    print xml
    print " !!!"
    complex_service = Array.new
    atomic_service_array.each do |item|
      complex_service << {"service" => Service.find(item["id"]), "functionalityID" => item["functionalityID"], "functionalityChild" => item["functionalityChild"]}
    
      
    end
    opinion = ComplexService.get_opinion_about(complex_service)
    
#    result = ""
#    xml_build = Builder::XmlMarkup.new(:target => result, :ident => 2 )
#    xml_build.instruct! 
#    xml_build.opinion {
#      xml_build.belief(opinion.belief)
#      xml_build.disbelief(opinion.disbelief)
#      xml_build.uncertainty(opinion.uncertainty)
#    }
    return SecurityOpinion.new(:belief => opinion.belief, :disbelief => opinion.disbelief, :uncertainty => opinion.uncertainty)
  end
  
  def get_opinion_OLD(xml)
    atomic_service_array = Hash.from_xml(xml)['services'].to_a
    #atomic_service_array = Hash.from_xml("<?xml version=\"1.0\" encoding=\"UTF-8\"?><services><service><id>1</id></service><service><id>2</id></service><service><id>3</id></service></services>")['services']['service'].to_a.flatten
    print "!!! "
    print xml
    print " !!!"
    complex_service = Array.new
    atomic_service_array.each do |item|
      complex_service << Service.find(item["id"])
    end
    
    opinion = ComplexService.get_opinion_about(complex_service)
    
    result = ""
    xml_build = Builder::XmlMarkup.new(:target => result, :ident => 2 )
    xml_build.instruct! 
    xml_build.opinion {
      xml_build.belief(opinion.belief)
      xml_build.disbelief(opinion.disbelief)
      xml_build.uncertainty(opinion.uncertainty)
    }
    return result
  end
end
