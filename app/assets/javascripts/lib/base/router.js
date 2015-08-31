App.Routers.Base = Backbone.Router.extend({

  route: function(route, name, callback) {
    var router = this;
    if (!callback) callback = this[name];

    var fn = function() {
      callback.apply(router, arguments)
    }

    return Backbone.Router.prototype.route.call(this, route, name, fn)
  },

  execute: function(callback, args) {
    if (callback) callback.apply(this, args);
  },
})
