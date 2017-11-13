if (typeof dvizh == "undefined" || !dvizh) {
    var dvizh = {};
}

dvizh.Discount = {
    init: function() {
        var timerContainer = '[data-role=discount-widget-timer]';
        var timerDays = '[data-role=discount-widget-days]';
        var timerHours = '[data-role=discount-widget-hours]';
        var timerMins = '[data-role=discount-widget-minutes]';
        var timerSecs = '[data-role=discount-widget-seconds]';
        $(document).ready(function() {
            var timeinterval = setInterval(function() {
                var t = dvizh.Discount.getTimeRemaining($(timerContainer).attr('data-endtime'));
                $(timerDays).html(t.days);
                $(timerHours).html(t.hours);
                $(timerMins).html(t.minutes);
                $(timerSecs).html(t.seconds);
                if(t.total <= 0) {
                    clearInterval(timeinterval);
                }
            }, 1000);
        });
    },
    getTimeRemaining: function(endtime) {
        var t = Date.parse(endtime) - Date.parse(new Date());
        var seconds = Math.floor((t / 1000) % 60);
        var minutes = Math.floor((t / 1000/60) % 60);
        var hours = Math.floor((t / (1000*60*60)) % 24);
        var days = Math.floor(t / (1000*60*60*24));
        return {
            'total': t,
            'days': days,
            'hours': hours,
            'minutes': minutes,
            'seconds': seconds
        };
    }
};

$(function() {
    dvizh.Discount.init();
});
