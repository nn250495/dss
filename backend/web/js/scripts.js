if (typeof dvizh == "undefined" || !dvizh) {
    var dvizh = {};
}

dvizh.backend = {
    init: function() {
        $('.treeview').on('click', function() {
            $('.treeview').removeClass('active');
            $('.treeview-menu').hide();
            $(this).addClass('active');
            $(this).find('.treeview-menu').show();
        });

        $('.sidebar-toggle').on('click', function() {
            if($('body').hasClass('sidebar-mini sidebar-collapse')) {
                $('body').removeClass('sidebar-mini sidebar-collapse');
            } else {
                $('body').addClass('sidebar-mini sidebar-collapse');
            }
        });
    }
};

dvizh.backend.init();