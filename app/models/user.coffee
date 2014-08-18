Grug.User = DS.Model.extend
  displayName: DS.attr "string"
  reports: DS.hasMany "report"
  comments: DS.hasMany "comment"
