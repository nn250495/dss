if (typeof dvizh == "undefined" || !dvizh) {
    var dvizh = {};
}

dvizh.Scripts = {
    init: function() {
        var fastViewInit = '[data-role=fast-view-init]';
        var fastViewModal = '[data-role=fast-view-body-modal]';
        var cartChangeCount = '[data-role=cart-change-count]';
        var cartRemoveProduct = '[data-role=cart-remove-product]';

        $(document).on('click', fastViewInit, function() {
            $(fastViewModal).load($(this).attr('data-url-ajax'));
        });

        $(document).on('change', cartChangeCount + ' input', function() {
            location.reload();
        });

        $(document).on('click', cartRemoveProduct + ' a', function() {
            location.reload();
        });
    }
};

$(function() {
    dvizh.Scripts.init();
});