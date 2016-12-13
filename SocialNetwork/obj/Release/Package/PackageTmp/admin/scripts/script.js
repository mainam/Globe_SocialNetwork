function checkImage() {

    var url = $('#txtOfferImage').val();
    if (url.length > 0) {
        $('#offerImage').attr('src', url);
        $('#offerImage').attr('style', 'display:in-line');
    }
    else {
        $('#offerImage').attr('src', null);
        $('#offerImage').attr('style', 'display:none');
    }
}

function DeleteConfirm() {
    return confirm("Are you sure!");
}
//back to top
$(function () { $(window).scroll(function () { if ($(this).scrollTop() != 0) { $('#bttop').fadeIn(); } else { $('#bttop').fadeOut(); } }); $('#bttop').click(function () { $('body,html').animate({ scrollTop: 0 }, 200); }); });

//select all text
$(function () {
    $(document).on('click', 'input[type=text]', function () { this.select(); });
});

