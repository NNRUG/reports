Grug.ReportsIndexRoute = Ember.Route.extend
  model: -> @store.findAll "report"
