
    $(document).ready(function(){
        function my(){
            $('#custom').addClass('animated zoomInDown').one('webkitAnimationEnd mozAnimationEnd msAnimationEnd oAnimationEnd animationend',function(){
                $(this).removeClass('animated zoomInDown');
            });
        }
    });