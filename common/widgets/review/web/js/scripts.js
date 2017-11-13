if (typeof dvizh == "undefined" || !dvizh) {
    var dvizh = {};
}

dvizh.Reviews = {
    init: function() {
        var formStar = '[data-role=review-form-star]';
        var formStarsContainer = '[data-role=review-form-stars-container]';
        var rateInput = '[data-role=rating-form-rateinput]';

        $(document).on('mouseenter', formStar, function() {
            var endValue = $(this).attr('data-value');
            for(var i = 1; i <= endValue; i++) {
                $(formStar + '[data-value='+i+'] i').removeClass('fa-star-o');
                $(formStar + '[data-value='+i+'] i').addClass('fa-star');
            }
            for(i = (parseInt(endValue) + 1); i <= 5; i++) {
                $(formStar + '[data-value='+i+'] i').removeClass('fa-star');
                $(formStar + '[data-value='+i+'] i').addClass('fa-star-o');
            }
        });

        $(document).on('mouseleave', formStarsContainer, function() {
            if($(formStar + '.active').length > 0) {
                var endValue = $(formStar + '.active').attr('data-value');
                for(var i = 1; i <= endValue; i++) {
                    $(formStar + '[data-value='+i+'] i').removeClass('fa-star-o');
                    $(formStar + '[data-value='+i+'] i').addClass('fa-star');
                }
                for(i = (parseInt(endValue) + 1); i <= 5; i++) {
                    $(formStar + '[data-value='+i+'] i').removeClass('fa-star');
                    $(formStar + '[data-value='+i+'] i').addClass('fa-star-o');
                }
            } else {
                $(formStar + ' i').removeClass('fa-star');
                $(formStar + ' i').addClass('fa-star-o');
            }
        });

        $(document).on('click', formStar, function(e) {
            var endValue = $(this).attr('data-value');
            $(formStar).removeClass('active');
            $(this).addClass('active');
            $(rateInput).val(endValue);
            for(var i = 1; i <= endValue; i++) {
                $(formStar + '[data-value='+i+'] i').removeClass('fa-star-o');
                $(formStar + '[data-value='+i+'] i').addClass('fa-star');
            }
            for(i = (parseInt(endValue) + 1); i <= 5; i++) {
                $(formStar + '[data-value='+i+'] i').removeClass('fa-star');
                $(formStar + '[data-value='+i+'] i').addClass('fa-star-o');
            }
            e.preventDefault;
            return false;
        });
    }
};

$(function() {
    dvizh.Reviews.init();
});