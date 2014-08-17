Grug.FirebaseRef = new Firebase "https://grrug.firebaseio.com/"

Grug.ApplicationAdapter = DS.FirebaseAdapter.extend
  firebase: Grug.FirebaseRef
