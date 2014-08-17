Grug.Comment = DS.Model.extend
  body: DS.attr "string"
  report: DS.belongsTo "report", embedded: true
