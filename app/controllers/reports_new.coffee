Grug.ReportsNewController = Ember.ObjectController.extend
  content:
    title: ""
    description: ""
    needAuthor: false
  actions:
    create: ->
      report = @store.createRecord("report", @get "model")
      report.set "author", Grug.Session.get("userRecord")
      report.save()
      @transitionToRoute 'reports.show', report
