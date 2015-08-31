App.Views.QadbResults.Index = App.Lib.View.Base.extend({
  id: 'qadb_results',
  template: 'qadb_results/index',

  events: {
  },

  initialize: function() {
    var view = this;
    this.render();
    this.results = new App.Models.QadbResult;
    this.results.fetch()
      .fail(function(data) {
          if(data.responseText.length == 0) {
            App.Lib.Flash.render({ error: 'Session has been terminated' });
          } else {
            App.Lib.Flash.render({ error: data.responseJSON.message });
          }
      })
      .success(function() {
        view.render_subviews();
      });
    console.log("index.js in qadb_result views");
  }
})

