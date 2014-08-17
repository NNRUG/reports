Grug.ReportsShowRoute = Ember.Route.extend
  model: ({report_id})->
    @store.find "report", report_id
  setupController: (controller, model) ->
    @controllerFor("comments.index").set("model", model.get("comments"))
    @_super.apply @, arguments
