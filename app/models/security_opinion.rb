class SecurityOpinion < ActionWebService::Struct
  member :belief,       :double
  member :disbelief,    :double
  member :uncertainty,  :double
end