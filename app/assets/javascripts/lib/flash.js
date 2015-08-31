_.extend(App.Lib.Flash, {
  render: function(params) {
    var flash_message = new App.Views.FlashMessage(params);

    this.$flash || ( this.$flash = this._find_$flash() );

    if ( ! flash_message.hide ) this.remove_current_flash();
    flash_message.render();
    this.current_flash = flash_message;

    if ( flash_message.hide ) {
      flash_message.slide_up();
      this.current_flash = undefined;
    } else {
      this.current_flash = flash_message;
    }

  },

  remove_current_flash: function() {
    if ( this.current_flash ) {
      this.current_flash.destroy();
      return ;
    }

    this._find_$flash();

    if ( this.$flash && !App.Lib.Utils.$is_empty(this.$flash) ) {
      this.$flash.children().remove();
    }
  },

  clear: function() { this.remove_current_flash() },

  _find_$flash: function() {
    var $flash = App.Lib.Regions.cache['flash'];
    if ( $flash ) return $flash.$el;

    $flash = App.Lib.Regions.find_or_create('flash').$el;

    if ( $flash ) { return $flash; } else { throw new Error('Flash not found') }
  }
})
