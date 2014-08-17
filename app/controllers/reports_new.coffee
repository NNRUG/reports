Grug.ReportsNewController = Ember.ObjectController.extend
  content:
    title: ""
    author: ""
    description: ""
    needAuthor: false
  actions:
    create: ->
      report = @store.createRecord("report", @get("model"))
      report.save()
      @transitionToRoute 'reports.show', report
