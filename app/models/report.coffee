Grug.Report = DS.Model.extend
  title: DS.attr "string"
  description: DS.attr "string"
  comments: DS.hasMany "comment", embedded: true
  author: DS.belongsTo "user", async: true
