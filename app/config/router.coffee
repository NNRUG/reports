Grug.Router.map ->
  @resource "reports", path: "/", ->
    @route "new"
    @route "show", path: "/:report_id"
