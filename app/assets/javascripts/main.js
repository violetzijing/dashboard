window.App = {

  config: {
    api_url_prefix: '/api/',
    default_region_id: 'content'
  },

  Models: {},
  Collections: {},
  Views: {
    QadbResults: {}
  },
  Routers: {},

  initialize: function() {
    new App.Routers.Index;
    new App.Routers.QadbResults;

    Backbone.history.start({
      pushState: true
    });
  },
};

$(document).ready(function(){

  $(document.body).on('click', 'a', function(e){
   e.preventDefault();
   Backbone.history.navigate(e.currentTarget.pathname, {trigger: true});
 });

  App.initialize();
});
