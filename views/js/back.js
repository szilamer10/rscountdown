/**
* Resolution-Studio.ro
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Commercial License
 * you can't distribute, modify or sell this code
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file
 * If you need help please contact szilamer.balogh@resolution-studio.ro
 *
 * @author    Szilamer <szilamer.balogh@resolution-studio.ro>
 * @copyright Resolution-Studio.ro
 * @license   commercial
*/

$(document).on('click','.button_container button',function(){
 $('.add_offer_container').css('display','flex');
});
$(document).on('click','#first_offer_container #ff_optin',function(){
    if ($("#ff_optin").prop('checked') == true) {
        setTimeout(function(){
        $("#first_offer_container").css('display','none');
        $(".second_countdown").css('display','block');
        $(".second_countdown #ff_optin").prop('checked',true);
        $("#first_offer_container #ff_optin").prop('checked',false);
    },500);
        
    }
    
});
$(document).on('click','.second_countdown #ff_optin',function(){
    if ($(".second_countdown #ff_optin").prop('checked') == false) {
        setTimeout(function(){
        $("#first_offer_container").css('display','block');
        $(".second_countdown").css('display','none');
        },500);
    }
    
});

$(document).mouseup(function(e) 
{
    var container = $(".add_offer_container");

    // if the target of the click isn't the container nor a descendant of the container
    if (!container.is(e.target) && container.has(e.target).length === 0) 
    {
        container.hide();
    }
});
 