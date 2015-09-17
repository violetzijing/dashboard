$(function () {
  $('.chart-option').click(function() {
    testsuite = this.dataset.testsuite;
    id = this.dataset.id;
    past_days = this.dataset.time;
    
    $('.ct-chart-' + id).html("");
    $.getJSON("/api/qadb_results/" + testsuite + "/past_days/" + past_days, function(data) {
      if(data.length > 0) {
        series_succeeded = []
        series_failed = []
        series_skipped = []
        series_internal_error = []
        labels_array = []
        $.each(data, function(key, val) {
          series_succeeded[key] = val.succeeded;
          series_failed[key] = val.failed;
          series_skipped[key] = val.skipped;
          series_internal_error[key] = val.internal_error;
          labels_array[key] = key
        });

        var chart = new Chartist.Line('.ct-chart-' + id, {
          labels: labels_array,
          series: [series_succeeded, series_failed, series_skipped, series_internal_error]
        }, {
          lineSmooth: Chartist.Interpolation.simple({
            divisor: 2
           }),
          fullWidth: true,
          chartPadding: {
            right: 20
          },
          low: 0 
        });
      } else {
        $('.ct-chart-' + id).html('<div class="alert alert-danger" role="alert">No results in this period.</div>');
      }
      chart.on('draw', function(data) {
      if(data.type === 'point') {
        var circle = new Chartist.Svg('circle', {
          cx: [data.x], cy:[data.y], r:[7],
        }, 'ct-circle');
        data.element.replace(circle);
      }
    });

    chart.on('draw', function(data) {
      if(data.type === 'line' || data.type === 'area') {
        data.element.animate({
          d: {
            begin: 1000 * data.index,
            dur: 200,
            from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
            to: data.path.clone().stringify(),
            easing: Chartist.Svg.Easing.easeOutQuint
          }
        });
      }
    });
    });
    
  })
});
