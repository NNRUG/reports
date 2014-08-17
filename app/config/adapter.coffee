Grug.FirebaseRef = new Firebase "https://grrug.firebaseio.com/"

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
      onUserChange: (->
        uid = @get("user").get("uid")
      ).observes("user")
    .create()

Grug.SimpleLogin = new FirebaseSimpleLogin Grug.FirebaseRef, (error, user) ->
  if error?
    #We need to do something with it
  else if user?
    Grug.Session.set "authed", true
    Grug.Session.set "user", user
  else
    console.log "WTF"
