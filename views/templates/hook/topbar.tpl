{*
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
*}

{foreach from=$countdown item=item}
{if $item.start_date_new}
	{if $item.end_date|strtotime > $smarty.now}
			
		<div id="custom-countdown">
<div class="promo-first-row">
<a class="promo-text"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="48px" height="48px" viewBox="0 0 48 68" enable-background="new 0 0 128 128" xml:space="preserve">  <image id="image0" width="48" height="48" x="0" y="0" href="data:image/png;base64,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 cTc/CgAAAABJRU5ErkJggg=="/>
</svg><span class="ctdwn-first-row">{$item.title}</span><br>
</a> 
<div id="demo"></div>
</div>
<div id="countdown-close"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
 <path fill-rule="evenodd" d="M25.192 8.222l-1.414-1.414L16 14.586 8.222 6.808 6.808 8.222 14.586 16l-7.778 7.778 1.414 1.414L16 17.414l7.778 7.778 1.414-1.414L17.414 16l7.778-7.778z"></path>
</svg></div>
<div class="promo-text-row-two"><div class="promo-two-text">{$item.description}</div><div class="promo-code">{l s="%voucher_code%" d='Shop.Theme.Catalog' sprintf=['%voucher_code%'=>$item.voucher_code]}</div></div></div>

		
	{else}
		
		<div id="custom-countdown">
<div class="promo-first-row">
<a class="promo-text"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="48px" height="48px" viewBox="0 0 48 68" enable-background="new 0 0 128 128" xml:space="preserve">  <image id="image0" width="48" height="48" x="0" y="0" href="data:image/png;base64,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 cTc/CgAAAABJRU5ErkJggg=="/>
</svg><span class="ctdwn-first-row">{$item.title_new}</span><br>
</a> 
<div id="demo"></div>
</div>
<div id="countdown-close"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
 <path fill-rule="evenodd" d="M25.192 8.222l-1.414-1.414L16 14.586 8.222 6.808 6.808 8.222 14.586 16l-7.778 7.778 1.414 1.414L16 17.414l7.778 7.778 1.414-1.414L17.414 16l7.778-7.778z"></path>
</svg></div>
<div class="promo-text-row-two"><div class="promo-two-text">{$item.description_new}</div><div class="promo-code">{l s="%voucher_code%" d='Shop.Theme.Catalog' sprintf=['%voucher_code%'=>$item.voucher_code_new]}</div></div></div>

		
	{/if}
{else}
	
	<div id="custom-countdown">
<div class="promo-first-row">
<a class="promo-text"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" width="48px" height="48px" viewBox="0 0 48 68" enable-background="new 0 0 128 128" xml:space="preserve">  <image id="image0" width="48" height="48" x="0" y="0" href="data:image/png;base64,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 cTc/CgAAAABJRU5ErkJggg=="/>
</svg><span class="ctdwn-first-row">{$item.title}</span><br>
</a> 
<div id="demo"></div>
</div>
<div id="countdown-close"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
 <path fill-rule="evenodd" d="M25.192 8.222l-1.414-1.414L16 14.586 8.222 6.808 6.808 8.222 14.586 16l-7.778 7.778 1.414 1.414L16 17.414l7.778 7.778 1.414-1.414L17.414 16l7.778-7.778z"></path>
</svg></div>
<div class="promo-text-row-two"><div class="promo-two-text">{$item.description}</div><div class="promo-code">{l s="%voucher_code%" d='Shop.Theme.Catalog' sprintf=['%voucher_code%'=>$item.voucher_code]}</div></div></div>

	
{/if}

{/foreach}
<script>
document.addEventListener("DOMContentLoaded", function () {
		
        var countdownJS = {$countdownJS nofilter};
		var myJSONString = JSON.stringify(countdownJS);
		var myEscapedJSONString = myJSONString.replace(/\\'/g, "\\'");
        	 
         var countdownArray = JSON.parse(myEscapedJSONString);

        var start_date = 0;
        var end_date= 0;
		
		var old_date=0;
		var current = new Date();
        for(const value of countdownArray){
			if(iOS()){
				old_date=new Date(value['end_date'].replace(/-/g, "/"));
			}else{
				old_date = new Date(value['end_date'].replace(/-/g, "/"));
			}

			if (current.getTime() < old_date.getTime()) {
				
             start_date = value['start_date'];
             end_date = value['end_date'] ;  
			 
			}
			else
			{	
				start_date = value['start_date_new'];
				console.log(start_date);
             	end_date = value['end_date_new'];
			 	console.log(end_date);
			}
        }
		
	
     if(iOS()){
		var actualDate = new Date();
	var startDate = new Date(start_date.replace(/-/g, "/"));
	var endDate = new Date(end_date.replace(/-/g, "/"));
	 
		 

	 }  
	  else{
		  
	 	var actualDate = new Date();
	 var startDate = new Date(start_date.replace(/-/g, "/"));
	 var endDate = new Date(end_date.replace(/-/g, "/"));
	// // console.log(actualDate);
	 
		console.log(startDate);
	 console.log(endDate);
	  }
	// var actualDate = new Date();
	// var startDate = new Date(start_date);
	// var endDate = new Date(end_date);
	// // console.log(actualDate);
	


		


	// var startDate = theyear + "/" + themonth + "/" + theday;

	if (actualDate > startDate && actualDate < endDate) {

		// Set the date we're counting down to
		var countDownDate = endDate.getTime();

		// Update the count down every 1 second
		var x = setInterval(function () {

			// Get today's date and time
			var now = new Date().getTime();

			// Find the distance between now and the count down date
			var distance = countDownDate - now;

			// Time calculations for days, hours, minutes and seconds
			var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			var seconds = Math.floor((distance % (1000 * 60)) / 1000);

			// Display the result in the element with id="demo"
			// if (prestashop.language.iso_code == 'en'){
			// 	document.getElementById("demo").innerHTML = "<div class='days'>" + (days < 10 ? "0" : "") + days + "<span> DAYS</span>" + "</div>" + "<div class='hours'>" + (hours < 10 ? "0" : "") + hours + "<span> HOURS</span>" + "</div>" + "<div class='minutes'>" + (minutes < 10 ? "0" : "") + minutes + "<span> MINUTES</span>" + "</div>" + "<div class='minutes'>" + (seconds < 10 ? "0" : "") + seconds + "<span> SECONDS</span>" + "</div>";
			// }else if (prestashop.language.iso_code == 'nl'){
			// 	document.getElementById("demo").innerHTML = "<div class='days'>" + (days < 10 ? "0" : "") + days + "<span> DAGEN</span>" + "</div>" + "<div class='hours'>" + (hours < 10 ? "0" : "") + hours + "<span> UUR</span>" + "</div>" + "<div class='minutes'>" + (minutes < 10 ? "0" : "") + minutes + "<span> MINUTEN</span>" + "</div>" + "<div class='minutes'>" + (seconds < 10 ? "0" : "") + seconds + "<span> SECONDEN</span>" + "</div>";
			// }else{
			// 	document.getElementById("demo").innerHTML = "<div class='days'>" + (days < 10 ? "0" : "") + days + "<span> JOUR</span>" + "</div>" + "<div class='hours'>" + (hours < 10 ? "0" : "") + hours + "<span> HEURE</span>" + "</div>" + "<div class='minutes'>" + (minutes < 10 ? "0" : "") + minutes + "<span> MINUTE</span>" + "</div>" + "<div class='minutes'>" + (seconds < 10 ? "0" : "") + seconds + "<span> SECONDE</span>" + "</div>";
			// }

			if (prestashop.language.iso_code == 'en'){
				document.getElementById("demo").innerHTML = "<div class='days'>" + (days < 10 ? "0" : "") + days + "<span>d</span>" + "</div>" + "<div class='hours'>" + (hours < 10 ? "0" : "") + hours + "<span> h</span>" + "</div>" + "<div class='minutes'>" + (minutes < 10 ? "0" : "") + minutes + "<span>min</span>" + "</div>" + "<div class='minutes'>" + (seconds < 10 ? "0" : "") + seconds + "<span>s</span>" + "</div>";
			}else if (prestashop.language.iso_code == 'nl'){
				document.getElementById("demo").innerHTML = "<div class='days'>" + (days < 10 ? "0" : "") + days + "<span>d</span>" + "</div>" + "<div class='hours'>" + (hours < 10 ? "0" : "") + hours + "<span> u</span>" + "</div>" + "<div class='minutes'>" + (minutes < 10 ? "0" : "") + minutes + "<span>min</span>" + "</div>" + "<div class='minutes'>" + (seconds < 10 ? "0" : "") + seconds + "<span>s</span>" + "</div>";
			}else{
				document.getElementById("demo").innerHTML = "<div class='days'>" + (days < 10 ? "0" : "") + days + "<span>j</span>" + "</div>" + "<div class='hours'>" + (hours < 10 ? "0" : "") + hours + "<span> h</span>" + "</div>" + "<div class='minutes'>" + (minutes < 10 ? "0" : "") + minutes + "<span>min</span>" + "</div>" + "<div class='minutes'>" + (seconds < 10 ? "0" : "") + seconds + "<span>s</span>" + "</div>";
			}


			// If the count down is finished, write some text
			if (distance < 0) {
				clearInterval(x);
				//document.getElementById("demo").innerHTML = "EXPIRED";
				$("#custom-countdown").addClass("hide-countdown");
			}
		}, 1000);

		$("#countdown-close").click(function () {
			$("#custom-countdown").addClass("hide-countdown");
			document.cookie = "countdownClosed=1";
		});

		let cookies = document.cookie.split(";");
		var myCountdownCookieValue = null;
		for (var i = 0; i < cookies.length; i++) {
			var tmpV = cookies[i].split("=");

			if (tmpV[0] == "countdownClosed")
				myCountdownCookieValue = 1
		}
		if (myCountdownCookieValue == null)
			$("#custom-countdown").css("display", "flex");

	}

	function iOS() {
  return [
    'iPad Simulator',
    'iPhone Simulator',
    'iPod Simulator',
    'iPad',
    'iPhone',
    'iPod'
  ].includes(navigator.platform)
  // iPad on iOS 13 detection
  || (navigator.userAgent.includes("Mac") && "ontouchend" in document)
}
});
</script>