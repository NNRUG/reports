Grug.UserIndexController = Ember.ObjectController.extend
  actions:
    login: -> Grug.SimpleLogin.login("google")
