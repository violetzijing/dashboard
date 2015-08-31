App.Collections.Base = Backbone.Collection.extend({
  url: function() {
    if ( typeof(this.resource) == 'undefined' ) {
      throw new Error("Uncomplete collection definition, no resource defined");
    }
    return App.config.api_url_prefix + this.resource;
  }
})
