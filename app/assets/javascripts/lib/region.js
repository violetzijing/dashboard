App.Lib.Region = function(region_id) {
  if ( !region_id ) throw new Error("Region must have an id");

  this.id    = region_id;
  this.views = {};

  this.$el = $('#' + this.id);

  if ( this.$el.length == 0 ) {
    throw new Error("Element with ID '" + this.id + "' not found in the dom tree");
  }
}

_.extend(App.Lib.Region.prototype, {

  add_view: function(view) {
    this.views[view.cid] = view;
  },

  remove_view: function(view) {
    delete(this.views[view.cid]);
  },

  // For clearing views
  clear: function() {
    var region = this;
    _.each(_.values(this.views), function(v) {
      v.destroy();
    });
  },

  // For wiping out the region completely
  destroy: function() {
    App.Lib.Regions.remove(this);
  },

  render_view: function(insert_keyword, view_$el) {
    this.$el[insert_keyword](view_$el);
  }
})
