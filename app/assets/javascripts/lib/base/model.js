App.Models.Base = Backbone.RelationalModel.extend({
  urlRoot: function() {
    /*
    var path = App.config.api_url_prefix + this.resource ;

    if ( this.id ) {
      path =
    if (!this.id) throw new Error("Missing id for " + this.resource + " model");
    */
    return App.config.api_url_prefix + this.resource ;
  },

  is_ready: function(callback) {
    var model = this;
    if ( !this.isValid(true) ) {
      App.Lib.Flash.render({error: 'Invalid attributes, please check your data'});
      return;
    }
    if ( !this.unsavedAttributes() ) {
      App.Lib.Flash.render({warning: 'No changes done, nothing to save'});
      return;
    }
    App.Lib.Flash.clear();
    callback.call();
  },

  validation_errors: {},

  patch: function(options) {
    var options = options || {};
    var model = this;
    options.patch = true;
    if ( options.success ) {
      options.original_success = options.success;
    }
    options.success = function() {
      model.resetAttributes()
      if (options.original_success) options.original_success.call(model);
    }
    return this.save(this.unsavedAttributes(), options);
  }
});

_.extend(Backbone.Validation.callbacks, {
  invalid: function(view, attr, error, selector) {
    view.model.validation_errors[attr] = error;
  },

  valid: function(view, attr, selector) {
    delete(view.model.validation_errors[attr]);
  }
})

Backbone.Validation.configure({
  forceUpdate: true
})

_.extend(Backbone.Model.prototype, Backbone.Validation.mixin);

