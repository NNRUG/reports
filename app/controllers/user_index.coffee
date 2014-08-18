Grug.UserIndexController = Ember.ObjectController.extend
  actions:
    login: (provider) -> Grug.SimpleLogin.login provider
    logout: -> Grug.SimpleLogin.logout()
