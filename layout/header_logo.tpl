{block name='layout-header-logo'}
	{if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
		{if JTL\Session\Frontend::getCustomer()->getID() !== 0}
			{if JTL\Session\Frontend::getCustomer()->kKundengruppe == 1}
				<style>
					#resellerNotice {
						position: fixed;
						top: 0;
						left: 0;
						right: 0;
						bottom: 0;
						z-index: 21337;
						background: var(--gradient-left);
						background: linear-gradient(135deg,var(--gradient-left) 0%,var(--gradient-right) 100%);
						align-items: center;
						justify-content: center;
						display: flex;
						color: #fff;
						flex-wrap: wrap;
					}
					#resellerNotice > div {
						max-width: 600px;
						padding: 1rem;
						text-align: center;
					}
					#resellerNotice h3.section-title {
						border-color: #fff;
						color: #000;
					}
					#resellerNotice h3.section-title .orange {
						color: #fff;
					}
					#resellSecs {
						opacity: 0;
					}
					#resellerNotice img {
						max-width: 300px;
					}
				</style>
				<div class="d-none" id="notEndkunde" data-user-id="{JTL\Session\Frontend::getCustomer()->getID()}" data-customer-group="{JTL\Session\Frontend::getCustomer()->kKundengruppe}"></div>
				<div id="resellerNotice">
					<div>
						<img src="/templates/Megabar/themes/smoke2u/gfx/smoke2u_haendlershop_b2b_redirect_logo.png" alt="Megabar Händlershop Logo" class="w-100 mb-3"/>
						<h3 class="section-title">{lang key="resellerRedirectHead" section="custom"}</h3>
						<p>{lang key="resellerRedirectText" section="custom"}</p>
					</div>
				</div>
				<script>
					var secondsToWait = 10;
					function resellCounter() {
						if ($("#resellSecs").length) {
							if (secondsToWait > 1) {
								$("#resellSecs").css("opacity", "1");
								$("#resellSecs").text(secondsToWait + " Sekunden");
							}
							if (secondsToWait == 1) {
								$("#resellSecs").text(secondsToWait + " Sekunde");
							}
							if (secondsToWait < 1) {
								$("#resellSecs").text("jetzt");
							}
							secondsToWait--;
						}
					}
					$(document).ready(function() {
						setInterval(resellCounter, 1000);
						setTimeout(function() {
							location = "https://www.megabar.de";
						}, 12000);
					});
				</script>
			{/if}
		{/if}
	{/if}
<div class="header-logo-bar">
	{block name='layout-header-logo-logo'}
		<div id="logo" class="logo-wrapper text-center" itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
			<span itemprop="name" class="d-none">{$meta_publisher}</span>
			<meta itemprop="url" content="{$ShopHomeURL}">
			<meta itemprop="logo" content="{$ShopLogoURL}">
			{link class="navbar-brand" href=$ShopHomeURL title=$Einstellungen.global.global_shopname}
			{if isset($ShopLogoURL)}
				<picture>
					<source srcset="{$ShopURL}/templates/Megabar/themes/smoke2u/gfx/megabar-logo-footer.webp" type="image/webp">
					<img src="{$ShopURL}/templates/Megabar/themes/smoke2u/gfx/megabar-logo-footer.png" class="" id="shop-logo" alt="{$Einstellungen.global.global_shopname}" width="180" height="50">
				</picture>
			{else}
				<span class="h1">{$Einstellungen.global.global_shopname}</span>
			{/if}
			{/link}
		</div>
	{/block}

	
	</div>
{/block}