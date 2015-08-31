App.Views.FlashMessage = App.Lib.View.Base.extend({
  className: 'flash-message',
  template: 'flash_message',
  options: {
    region: { id: 'flash', clear: true }
  },

  allowed_types: [ 'notice', 'error', 'info', 'warning' ],

  initialize: function(params) {
    this._build_message(params || {})
  },

  render: function(params) {
    if ( params ) this._build_message(params);
    this._super().render.call(this, {type: this.type, message: this.message});
  },

  _build_message: function(params) {
    this.hide = params.hide || false;
    this.type = _.keys(_.pick(params, this.allowed_types))[0];
    this.message = params[this.type];
    if ( params.clear === false ) {
      this.options.region.clear = false;
    }
  },

  slide_up: function(){
    var message = this;
    this.$el.delay(4000).slideUp(700, function() { message.destroy(); });
  }
})
