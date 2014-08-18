Grug.FirebaseRef = new Firebase "https://grrug.firebaseio.com/_ENV_/"

Grug.ApplicationAdapter = DS.FirebaseAdapter.extend
  firebase: Grug.FirebaseRef

Grug.initializer
  name: "session"
  initialize: (container, application) ->
    store = container.lookup "store:main"
    application.Session = Ember.Object.extend
      init: ->
        @_super()
        @set "authed", false
        @set "user", null
        @set "userRecord", null
      onUserChange: (->
        unless @get("user")
          @set "userRecord", null
          return
        uid = @get("user").uid
        console.log uid
        store.find("user", uid)
        .then (user) =>
          @set "userRecord", user
        .catch =>
          userRecord = store.createRecord "user",
            id: uid
            displayName: @get("user").displayName
          userRecord.save()
          @set "userRecord", userRecord
      ).observes("user")
    .create()

Grug.SimpleLogin = new FirebaseSimpleLogin Grug.FirebaseRef, (error, user) ->
  if error?
    #We need to do something with it
  else if user?
    Grug.Session.set "authed", true
    Grug.Session.set "user", user
  else if Grug.Session?
    Grug.Session.set "authed", false
    Grug.Session.set "user", null
