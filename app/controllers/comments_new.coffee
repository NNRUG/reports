Grug.CommentsNewController = Ember.ObjectController.extend
  actions:
    send: ->
      comment = @store.createRecord "comment", @getProperties "body"
      @get("model").get("comments").addObject comment
      @set("body", "")
      @get("model").save()
