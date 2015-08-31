App.Routers.Index = App.Routers.Base.extend({
  routes: {
    '': 'index'
  },

  index: function() {
    new App.Views.Index;
  }
})

