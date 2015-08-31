App.Routers.QadbResults = App.Routers.Base.extend({
  routes: {
    'qadb_results' : 'index'
  },

  index: function() {
    new App.Views.QadbResults.Index;
  }
})
