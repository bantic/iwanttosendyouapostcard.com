/**
* @author Remy Sharp
* @url http://remysharp.com/2007/01/25/jquery-tutorial-text-box-hints/
*/

(function ($) {

$.fn.hint = function (blurClass) {
    if (!blurClass) blurClass = 'blur';
    
    return this.each(function () {
        var $input = $(this),
            title = $input.attr('title'),
            $form = $(this.form),
            $win = $(window);

        function remove() {
            var value_replaced = this.value.replace(/\s/g,"");
            var title_replaced = title.replace(/\s/g,"");
            if (value_replaced === title_replaced && $input.hasClass(blurClass)) {
                $input.val('').removeClass(blurClass);
            }
        }

        // only apply logic if the element has the attribute
        if (title) { 
            // on blur, set value to title attr if text is blank
            $input.blur(function () {
                if (this.value === '') {
                    $input.val(title).addClass(blurClass);
                }
            }).focus(remove).blur(); // now change all inputs to title
            
            // clear the pre-defined text when form is submitted
            $form.submit(remove);
            $win.unload(remove); // handles Firefox's autocomplete
        }
    });
};

})(jQuery);