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
//= require bootstrap-clockpicker
//= require clockpicker
//= require bootstrap-datetimepicker.min
//= require bootstrap-sprockets
//= require_tree .

var registered = false;
var reservationReady = function() {
    if (!jQuery('.reservation') || registered) return;

    var datetimepickerstart = jQuery('#reservation-datetimepicker-start').datetimepicker({
        locale: 'en',
        // defaultDate: '1/1/2015',
        format: 'LT',
    });
    var datetimepickerend = jQuery('#reservation-datetimepicker-end').datetimepicker({
        locale: 'en',
        // defaultDate: '1/1/2015',
        format: 'LT',
    });

    var calendar = jQuery('#calendar').fullCalendar({
        lang: 'en',
        timezone: 'America/Chicago',

        googleCalendarApiKey: 'AIzaSyDGV_874GtglGGJlevdhc3n8Mt_sISyFYw',
        events: 'villalpandoc@gmail.com',

        eventClick: function(event) {
            // opens events in a popup window
            var win = window.open(event.url, '_blank');
            if(win){
                //Browser has allowed it to be opened
                win.focus();
            }else{
                //Broswer has blocked it
                alert('Please allow popups for this site');
            }
            return false;
        },

        selectable: true,
        selectHelper: true,


        select: function(start, end, allDay) {
            // console.log(start.format('M/D/YYYY'));
            jQuery('.reservation-modal').modal();
            datetimepickerstart.data('DateTimePicker').date(start);
            datetimepickerend.data('DateTimePicker').date(start);

            // if (title) {
            //     calendar.fullCalendar('renderEvent',
            //         {
            //             title: title,
            //             start: start,
            //             end: end,
            //             allDay: allDay
            //         },
            //         true // make the event "stick"
            //     );
            // }
            // calendar.fullCalendar('unselect');
        }
    });

    jQuery('#reservation-form-submit').click(function() {
        // var start = datetimepickerstart.data('DateTimePicker').date().format('MM/DD/YYYY - H:mm');
        var start = datetimepickerstart.data('DateTimePicker').date().format('YYYY-MM-DDTHH:mm:ss');
        // var end = datetimepickerend.data('DateTimePicker').date().format('MM/DD/YYYY - H:mm');
        var end = datetimepickerend.data('DateTimePicker').date().format('YYYY-MM-DDTHH:mm:ss');
        //console.log(datetimepickerend.data('DateTimePicker').date().utc().format())


        var start = moment.tz(start, 'America/Chicago').format();
        var end = moment.tz(end, 'America/Chicago').format();

        var formData = {startDate: start, endDate: end};

        // console.log(formData);
        // return;

        jQuery.ajax({
            url : "/reservations/create",
            type: "POST",
            data : formData,
            success: function(data, textStatus, jqXHR)
            {
                console.log("SUccfunct")
                console.log(data)
                // Don't need to do this as long as updating GCal
                // var eventJson = jQuery.parseJSON(data);
                // var start = new Date(parseInt(eventJson['start']) * 1000),
                //     end = new Date(parseInt(eventJson['end']) * 1000);
                // var startUTC = new Date(start.getTime() + start.getTimezoneOffset() * 60000),
                //     endUTC = new Date(end.getTime() + end.getTimezoneOffset() * 60000);
                // var calEvent = {
                //     title: 'Vehicle Reservation',
                //     start: startUTC,
                //     end: endUTC
                // };

                // calendar.fullCalendar('renderEvent', calEvent, true);
                jQuery('.reservation-modal').modal('hide');
                //jQuery('body').append(data);
                calendar.fullCalendar('unselect');
                calendar.fullCalendar('refetchEvents');
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                console.log("ERROR");
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
            }
        });

        return false;
    });
}

// jQuery(document).ready(function() {
//     registered = false;
//     reservationReady();
// });
jQuery(window).on('page:change', reservationReady);
