// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ./fullcalendar/lib
//= require_tree ./fullcalendar
//= require bootstrap-sprockets
//= require_tree .

var reservationReady = function() {
    jQuery('#calendar').fullCalendar({
        lang: 'en',
    
        // To make your own Google API key, follow the directions here:
        // http://fullcalendar.io/docs/google_calendar/
        googleCalendarApiKey: 'AIzaSyAGmJE0j1dmN8V2zTKB4ts7qt1j2QlAoIg',
    
        // US Holidays
        events: '0t4f3bofduamfqof89t96tg1jk@group.calendar.google.com',
        
        eventClick: function(event) {
            // opens events in a popup window
            window.open(event.url, 'gcalevent', 'width=700,height=600');
            return false;
        },
        
        
    });
}

jQuery('.reservation').ready(reservationReady);
