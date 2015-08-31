App.Views.Index = App.Lib.View.Base.extend({
  id: 'index',
  template: 'index',
  options: {
    region: { id: 'content' }
  },

  initialize: function() {
    this.render();
  }
})
