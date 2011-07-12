class OpinionApi < ActionWebService::API::Base
  api_method :get_opinion, :expects => [:string], :returns => [:string]
  api_method :xsd_test, :expects => [:string], :returns => [SecurityOpinion]
end
