// Кнопка наверх

$(document).ready(function () {
    $(document.body).append('<a id="back_top" href="#"></a>');
    $('#back_top').hide();

    $(window).scroll(function () {
        if ($(this).scrollTop() > 120) {
            $('#back_top').fadeIn('slow');
        } else {
            $('#back_top').fadeOut('slow');
        };
    });

    $('#back_top').on('click', function (e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: 0
        }, 800);
        $('#back_top').fadeOut('slow').stop();
    });
});

// Фильтрация для input

$('input.num').keyup(function () {
    this.value = this.value.replace(/[^0-9\.]/g, '');
});

// Прилипание меню

$(window).scroll(function () {
    if ($(this).scrollTop() > 45) {
        $('.sticky').addClass('sticky-top');
    } 
    else {
        $('.sticky').removeClass('sticky-top');
    }
});

// Удаляем элемент из выпадающей корзины

$('.top-cart .remove-item').on('click', function(){
    $('.item-in-cart:hover').remove();
    if($.trim($('.item-list').text()) == '') {
        $('.item-list').text('Корзина пуста. Давайте добавим что-нибудь :)');
    }
});

// Общий ремув элементов

$('.remove-this').on('click', function(){
    $(this).parent().remove();
});

// Количество в корзину

$('.count .minus').click(function(){
    var data = $(this).closest('.count').find('input').val();
    if (data > 1) {
        $(this).closest('.count').find('input').val(parseInt(data) - 1);
    }
   return false; 
});
$('.count .plus').click(function(){
    var data = $(this).closest('.count').find('input').val();
    $(this).closest('.count').find('input').val(parseInt(data) + 1);
   return false; 
});

// Плавный переход по ссылкам

$('a.smooth').click(function(){
    var el = $(this).attr('href');
    $('body').animate({
        scrollTop: $(el).offset().top - 50}, 800);
    return false; 
});

// Корзина на мобильных

$('.top-cart .visible-xs.pull-right').on('click', function(){
    $('.top-cart ul').hide();
});
$('.top-cart > a').on('click',function(e){
    w = screen.width; 
    if(w < 769) {
        e.preventDefault();
        $('.top-cart ul').show();
    }
});

// Меню на мобильных

deviceWidth = screen.width;
$(document).ready(function (){
    if(deviceWidth < 769) {
        $('.submenu').attr('style', 'display:none;');
    }
});
$('.parent .fa').on('click', function(){
    $(this).closest('li').children('.fa').toggle();
    $(this).closest('li').children('.submenu').toggle();
});

// Сворачиваем фильтры на мобилке

$(document).ready(function () {
    w = screen.width; 
    if(w < 768) {
        $('.filters .panel-collapse').removeClass('in');
        $('.filters .option-name').attr('aria-expanded', 'false');
    }
});

// Этапы оформления заказа подсветка

$('.cart-tab li a').on("click", function(){
    $(this).addClass("active");
    $(this).parent('li').prevAll('li').find('a').addClass("active");
    $(this).parent('li').nextAll('li').find('a').removeClass("active");
});

// Корзина рассчет суммы

$('.checkout .minus, .checkout .plus').on('click', function(){
    var price = $(this).closest('tr').find('.price').text();
    var count = $(this).closest('tr').find('.quantity').val();
    var sum = price * count;
    $(this).closest('tr').find('.sum').text(sum);
    recalcCart();
});
$('.checkout a.remove').on('click', function(){
    $('.checkout tr:hover').remove();
    recalcCart();
});

function recalcCart() {
    var sum = 0;
    $('.sum').each(function() {
        sum += +$(this).text()
    });
    $('#cartTotal').text(sum);
    var discount = $('#cartDiscount').text();
    var sumTopay = sum - discount;
    $('#sumTopay').text(sumTopay);
}

// Страница регистрация

$(document).ready(function () {
    $('#accReset, #accRegister').hide();
    $('#accRegisterLink').on('click', function(){
        $('#accReset').slideUp();
        $('#accLogin').slideUp();
        $('#accRegister').slideDown();
    });
    $('#accResetLink').on('click', function(e){
        e.preventDefault();
        $('#accReset').slideDown();
    });
    $('#accRegisterCancel').on('click', function(e){
        e.preventDefault();
        $('#accRegister').slideUp();
        $('#accLogin').slideDown();
    });
    $('#accResetCancel').on('click', function(e){
        e.preventDefault();
        $('#accReset').slideUp();
    });
});