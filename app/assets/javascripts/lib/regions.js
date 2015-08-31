_.extend(App.Lib.Regions, {

  // Stored regions' instances
  cache: {},

  // If the cache contains the region defined by its id, return it
  // Otherwise create a new one and return it
  find_or_create: function(region_id) {
    var region = this.cache[region_id];
    if ( region ) return region;

    region = new App.Lib.Region(region_id);
    this.cache[region_id] = region;
    return region;
  },

  remove: function(region) {
    delete(this.cache[region.id]);
  },

  all: function() {
    return _.values(this.cache) || [];
  },

  clear: function() {
    var cache = this.cache;
    _.each(this.all(), function(region) {
      region.clear();
      region.destroy();
    });
  }
})
