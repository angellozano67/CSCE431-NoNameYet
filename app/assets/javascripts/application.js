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
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        // defaultDate: '2015-02-12',
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: []
    });
}

jQuery('.reservation').ready(reservationReady);
