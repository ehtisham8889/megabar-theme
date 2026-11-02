{block name='layout-header-head-meta'}
	<meta http-equiv="content-type" content="text/html; charset={$smarty.const.JTL_CHARSET}">
	<meta name="description" itemprop="description" content={block name='layout-header-head-meta-description'}"{$meta_description|truncate:1000:"":true}{/block}">
	{if !empty($meta_keywords)}
		<meta name="keywords" itemprop="keywords" content="{block name='layout-header-head-meta-keywords'}{$meta_keywords|truncate:255:'':true}{/block}">
	{/if}
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	{if $nSeitenTyp == 2 && $Suchergebnisse->getPages()->getCurrentPage() != 1} {* Ausnahme fuer paginierte Produktlisten *}
		<meta name="robots" content="noindex">
	{elseif $smarty.server.REQUEST_URI|strstr:"?" || $smarty.server.REQUEST_URI|strstr:"_" || $smarty.server.REQUEST_URI|strstr:"="  || $smarty.server.REQUEST_URI|strstr:"::"} {* Ausnahme fuer Parameter-URLs *}
		<meta name="robots" content="noindex">
	{else}
		{$noindex = $bNoIndex === true  || (isset($Link) && $Link->getNoFollow() === true)}
		<meta name="robots" content="{if $robotsContent}{$robotsContent}{elseif $noindex}noindex{else}index, follow{/if}">
	{/if}

	<meta itemprop="url" content="{$cCanonicalURL}"/>
	<meta property="og:type" content="website" />
	<meta property="og:site_name" content="{$meta_title}" />
	<meta property="og:title" content="{$meta_title}" />
	<meta property="og:description" content="{$meta_description|truncate:1000:"":true}" />
	<meta property="og:url" content="{$cCanonicalURL}"/>

	{$showImage = true}
	{$navData = null}
	{if !empty($oNavigationsinfo)}
		{if $oNavigationsinfo->getCategory() !== null}
			{$showImage = in_array($Einstellungen['navigationsfilter']['kategorie_bild_anzeigen'], ['B', 'BT'])}
			{$navData = $oNavigationsinfo->getCategory()}
		{elseif $oNavigationsinfo->getManufacturer() !== null}
			{$showImage = in_array($Einstellungen['navigationsfilter']['hersteller_bild_anzeigen'], ['B', 'BT'])}
			{$navData = $oNavigationsinfo->getManufacturer()}
		{elseif $oNavigationsinfo->getCharacteristicValue() !== null}
			{$showImage = in_array($Einstellungen['navigationsfilter']['merkmalwert_bild_anzeigen'], ['B', 'BT'])}
			{$navData = $oNavigationsinfo->getCharacteristicValue()}
		{/if}
	{/if}

	{if $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && !empty($Artikel->getImage(JTL\Media\Image::SIZE_LG))}
		<meta itemprop="image" content="{$Artikel->getImage(JTL\Media\Image::SIZE_LG)}" />
		<meta property="og:image" content="{$Artikel->getImage(JTL\Media\Image::SIZE_LG)}">
		<meta property="og:image:width" content="{$Artikel->getImageWidth(JTL\Media\Image::SIZE_LG)}" />
		<meta property="og:image:height" content="{$Artikel->getImageHeight(JTL\Media\Image::SIZE_LG)}" />
	{elseif $nSeitenTyp === $smarty.const.PAGE_NEWSDETAIL && !empty($newsItem->getImage(JTL\Media\Image::SIZE_LG))}
		<meta itemprop="image" content="{$newsItem->getImage(JTL\Media\Image::SIZE_LG)}" />
		<meta property="og:image" content="{$newsItem->getImage(JTL\Media\Image::SIZE_LG)}" />
		<meta property="og:image:width" content="{$newsItem->getImageWidth(JTL\Media\Image::SIZE_LG)}" />
		<meta property="og:image:height" content="{$newsItem->getImageHeight(JTL\Media\Image::SIZE_LG)}" />
	{elseif !empty($navData) && !empty($navData->getImage(JTL\Media\Image::SIZE_LG))}
		<meta itemprop="image" content="{$navData->getImage(JTL\Media\Image::SIZE_LG)}" />
		<meta property="og:image" content="{$navData->getImage(JTL\Media\Image::SIZE_LG)}" />
		<meta property="og:image:width" content="{$navData->getImageWidth(JTL\Media\Image::SIZE_LG)}" />
		<meta property="og:image:height" content="{$navData->getImageHeight(JTL\Media\Image::SIZE_LG)}" />
	{else}
		<meta itemprop="image" content="{$ShopLogoURL}" />
		<meta property="og:image" content="{$ShopLogoURL}" />
	{/if}
{/block}

{block name='layout-header-head-resources-preload'}
    <link rel="preload" href="{$ShopURL}/{$templateDir}themes/base/fontawesome/webfonts/fa-solid-900.woff2" as="font" crossorigin/>
    <link rel="preload" href="{$ShopURL}/{$templateDir}themes/base/fontawesome/webfonts/fa-regular-400.woff2" as="font" crossorigin/>
{/block}


{block name='layout-header-head-theme-color'}
    <meta name="theme-color" content="#e0231d" />
    {* Megabar Speed: former megabar.css, inlined to save a render-blocking request *}
    {literal}<style>
/* ===== Megabar Overrides ===== */

/* Mobile header like Smoke2u: only on phones (body.is-mobile) */
body.is-mobile #jtl-nav-wrapper nav.navbar {
  display: flex !important;
  flex-wrap: nowrap !important;
  align-items: center !important;
}
body.is-mobile #jtl-nav-wrapper .nav-logo-wrapper {
  display: contents !important;
}

/* 1. Burger */
body.is-mobile #jtl-nav-wrapper .nav-logo-wrapper .toggler-logo-wrapper {
  order: 1 !important;
  flex: 0 0 auto !important;
}
/* 2. Search icon */
body.is-mobile #jtl-nav-wrapper .main-search-wrapper {
  order: 2 !important;
  flex: 0 0 auto !important;
  width: auto !important;
  max-width: none !important;
}
/* 3. Logo, centered */
body.is-mobile #jtl-nav-wrapper .nav-logo-wrapper > :not(.toggler-logo-wrapper) {
  order: 3 !important;
  flex: 1 1 auto !important;
  text-align: center !important;
}
body.is-mobile #shop-logo {
  max-height: 44px !important;
  width: auto !important;
}
/* 4. User + cart */
body.is-mobile #jtl-nav-wrapper .nav-icons-wrapper {
  order: 4 !important;
  flex: 0 0 auto !important;
  width: auto !important;
  align-self: center !important;
  padding-top: 0 !important;
  padding-bottom: 0 !important;
}

/* Hide the search bar, the search icon opens search */
body.is-mobile .search-form-wrapper-fixed,
body.is-mobile .main-search-wrapper form {
  display: none !important;
}

/* Remove extra white space below the header */
body.is-mobile #jtl-nav-wrapper .menu-search-position-center,
body.is-mobile #jtl-nav-wrapper .menu-center-center {
  padding-bottom: 0 !important;
  margin-bottom: 0 !important;
  min-height: 0 !important;
}

/* Vertical alignment of user + cart */
body.is-mobile #jtl-nav-wrapper .nav-icons-wrapper ul {
  display: flex !important;
  align-items: center !important;
  margin: 0 !important;
}
body.is-mobile #jtl-nav-wrapper .nav-icons-wrapper li {
  display: flex !important;
  align-items: center !important;
}
body.is-mobile #jtl-nav-wrapper .nav-icons-wrapper .nav-link {
  padding-top: 0 !important;
  padding-bottom: 0 !important;
}

/* Footer: VAT text clear of the cookie button */
@media (max-width: 767.98px) {
  .newfooterdark { padding-bottom: 4.5rem; }
  .newfooterdark #system-credits { text-align: left; padding: .5rem 0 0; }
}

#doofindericon { color: inherit; background: none; line-height: 1; }


/* ===== Mobile: no horizontal overflow ===== */

/* 1. Cookie banner no wider than the screen */
body.is-mobile #consent-manager {
  max-width: calc(100vw - 32px) !important;
}

/* 2. Make the header row narrower */
body.is-mobile #jtl-nav-wrapper .main-search-wrapper,
body.is-mobile #jtl-nav-wrapper .nav-icons-wrapper {
  padding-left: 4px !important;
  padding-right: 4px !important;
}
body.is-mobile #jtl-nav-wrapper .nav-icons,
body.is-mobile #jtl-nav-wrapper .shop-nav {
  padding-left: 0 !important;
}
body.is-mobile #jtl-nav-wrapper .nav-logo-wrapper > :not(.toggler-logo-wrapper) {
  min-width: 0 !important;
}

/* 3. Long texts and headings wrap */
body.is-mobile main p,
body.is-mobile main strong,
body.is-mobile main h1,
body.is-mobile main h2 {
  overflow-wrap: anywhere;
  hyphens: auto;
}

/* Safety net (clip instead of hidden, so sticky header/filter keep working) */
html:has(body.is-mobile),
body.is-mobile {
  overflow-x: clip;
}
</style>{/literal}
    {literal}
<script>
/* Megabar: footer accordion without jumping to top (anchor script conflict) */
document.addEventListener('click', function (e) {
  var a = e.target.closest('a[data-toggle="collapse"][href^="#crd-cllps-"]');
  if (!a) return;
  e.preventDefault();
  e.stopImmediatePropagation();
  var t = document.querySelector(a.getAttribute('href'));
  if (t && window.jQuery) jQuery(t).collapse('toggle');
}, true);

/* Megabar: make smokelink spans clickable (also on mobile) */
document.addEventListener('click', function (e) {
  var s = e.target.closest('.smokelink[data-href]');
  if (!s) return;
  e.preventDefault();
  var u = s.getAttribute('data-href');
  var t = s.getAttribute('data-target') || '_self';
  if (t === '_blank') window.open(u, '_blank', 'noopener');
  else window.location.href = u;
}, true);

/* Megabar: mobile breadcrumb arrow says "Zurück" instead of duplicating the page name */
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.breadcrumb-item.breadcrumb-arrow').forEach(function (li) {
    ['itemprop', 'itemscope', 'itemtype'].forEach(function (x) { li.removeAttribute(x); });
    li.querySelectorAll('[itemprop]').forEach(function (el) { el.removeAttribute('itemprop'); });
    var a = li.querySelector('a');
    if (!a) return;
    a.setAttribute('aria-label', 'Zurück zu ' + a.textContent.trim());
    var t = a.querySelector('span') || a;
    t.textContent = 'Zurück';
  });
});

//* Megabar: hide sold-out items in "Ähnliche Artikel" (x-related), stay visible elsewhere */
(function () {
  function soldOut(el) {
    var b = el.querySelector('[class*=ribbon],[class*=badge]');
    return !!(b && /ausverkauft/i.test(b.textContent));
  }
  var tries = 0;
  function run() {
    if (!document.querySelector('.productbox.x-related')) return;
    tries++;
    var $ = window.jQuery;
    if ($ && $.fn.slick) {
      var $s = $('.productbox.x-related').closest('.slick-initialized');
      if ($s.length) {
        $s.each(function () {
          var $x = $(this);
          if ($x.data('mbFiltered')) return;
          $x.data('mbFiltered', true);
          $x.slick('slickFilter', function () { return !soldOut(this); });
        });
        return;
      }
    }
    if (tries < 40) setTimeout(run, 250);
  }
  document.addEventListener('DOMContentLoaded', run);
})();
</script>
{/literal}
    <style>
        .productbox .danger-symbol-array:not(.megabar-skull) {
            left: 10px !important;
            right: auto !important;
        }
        #add-to-cart .basket-form-inline > .alert.alert-info {
            display: none !important;
        }
    </style>
{/block}
{if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2C"}
    
   {block name='layout-header-body-tag' append}
        <div id="agechecker" class="d-none">
            <div class="agecheck-container">
                <div class="inner">
                    <p class="h3">{lang key="ageCheckHeadline" section="custom"}</p>
                    <p>{lang key="ageCheckText" section="custom"}</p>
                    <div class="actions d-flex">
                        <span class="btn btn-danger" data-age-trigger="no" data-age-target="{lang key="ageCheckNoTarget" section="custom"}">{lang key="ageCheckNo" section="custom"}</span>
                        <span class="btn btn-success" data-age-trigger="yes">{lang key="ageCheckYes" section="custom"}</span>
                    </div>
                </div>
            </div>
        </div>
    {/block}
    {block name='layout-header-secure-checkout'}
        <a href="" class="btn btn-primary btn-sm">Zurück zum Warenkorb</a>
        <div class="secure-checkout-topbar ml-auto-util d-none d-lg-block">
            {block name='layout-header-secure-include-header-top-bar'}
                {include file='layout/header_top_bar.tpl'}
            {/block}
        </div>
    {/block}
{/if}
{* B2B query if shop is B2B and if customer is logged in *}
{if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
    {block name='layout-header-header'}
        <div class="s2uskiplinks">
            {link href="#main-wrapper" class="btn-skip-to"}
                {lang key='skipToContent'}
            {/link}
            {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
                {link href="#search-header" class="btn-skip-to"}
                    {lang key='skipToSearch'}
                {/link}
                {link href="#mainNavigation" class="btn-skip-to"}
                    {lang key='skipToNav'}
                {/link}
            {/if}
        </div>
    {if JTL\Session\Frontend::getCustomer()->getID() === 0}
    {else}
        
            
      
        {$headerWidth=$Einstellungen.template.header.header_full_width}
        {if (($Einstellungen.template.header.menu_scroll !== 'menu' && $Einstellungen.template.header.menu_single_row === 'Y')
                || $Einstellungen.template.header.menu_single_row === 'N'
            )
            && $Einstellungen.template.header.menu_show_topbar === 'Y'
            && $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
            {block name='layout-header-branding-top-bar'}
                
                <div id="header-top-bar" class="d-none topbar-wrapper {if $Einstellungen.template.header.menu_single_row === 'Y'}full-width-mega{/if} {if $Einstellungen.template.header.header_full_width === 'Y'}is-fullwidth{/if} d-lg-flex">
                    <div class="{if $headerWidth === 'B'}container{else}container-fluid {if $headerWidth === 'N'}container-fluid-xl{/if}{/if} d-lg-flex flex-row-reverse">
                        {include file='layout/header_top_bar.tpl'}
                    </div>
                </div>
            {/block}
        {/if}
        <header class="{if JTL\Session\Frontend::getCustomer()->getID() === 0}{else}user-logged-in{/if} d-print-none {if $Einstellungen.template.header.menu_single_row === 'Y'}full-width-mega{/if}
                    {if (!$isMobile || $Einstellungen.template.header.mobile_search_type !== 'fixed') && $Einstellungen.template.header.menu_scroll !== 'none'}sticky-top{/if}
                    fixed-navbar theme-{$Einstellungen.template.theme.theme_default}"
                id="jtl-nav-wrapper">
            {if $Einstellungen.template.header.menu_single_row === 'Y'}
                {block name='layout-header-include-header-menu-single-row'}
                    {include file='layout/header_menu_single_row.tpl'}
                {/block}
            {else}
                {block name='layout-header-container-inner'}
                    <div class="{if $headerWidth === 'B'}container{else}container-fluid {if $headerWidth === 'N'}container-fluid-xl{/if}{/if}">
                    {block name='layout-header-category-nav'}
                        {block name='layout-header-category-nav-logo'}
                            {include file='layout/header_logo.tpl'}
                        {/block}
                        {navbar toggleable=true fill=true type="expand-lg" class="justify-content-start {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}align-items-center-util{else}align-items-lg-end{/if}"}
                            {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}
                                {block name='layout-header-secure-checkout'}
                                    <a href="" class="btn btn-primary btn-sm">Zurück zum Warenkorb</a>
                                    <div class="secure-checkout-topbar ml-auto-util d-none d-lg-block">
                                        {block name='layout-header-secure-include-header-top-bar'}
                                            {include file='layout/header_top_bar.tpl'}
                                        {/block}
                                    </div>
                                {/block}
                            {else}
                                {block name='layout-header-branding-shop-nav'}
                                    {include file='layout/header_nav_icons.tpl'}
                                {/block}

                                {block name='layout-header-include-categories-mega'}
                                    {include file='layout/header_categories.tpl' menuMultipleRows=false}
                                {/block}
                            {/if}
                        {/navbar}
                    {/block}
                    </div>
                {/block}
            {/if}
            {block name='layout-header-search'}
                {if $Einstellungen.template.header.mobile_search_type === 'fixed'}
                    <div class="d-lg-none search-form-wrapper-fixed container-fluid container-fluid-xl order-1">
                        {include file='snippets/search_form.tpl' id='search-header-mobile-top'}
                    </div>
                {/if}
            {/block}
        </header>
        {block name='layout-header-search-fixed'}
            {if $Einstellungen.template.header.mobile_search_type === 'fixed' && $isMobile}
                <div class="container-fluid container-fluid-xl fixed-search fixed-top smoothscroll-top-search d-lg-none d-none">
                    {include file='snippets/search_form.tpl' id='search-header-mobile-fixed'}
                </div>
            {/if}
        {/block}
    {/if}
    {/block}
{/if}

{if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
    {if JTL\Session\Frontend::getCustomer()->getID() === 0 && ($nSeitenTyp !== 14 && $nSeitenTyp !== 18 && $nSeitenTyp !== 4)}
        {block name='layout-header-main-wrapper-starttag'}
        {/block}
    {else}
       
        {block name='layout-header-main-wrapper-starttag'}
        <main id="main-wrapper" class="{if $bExclusive} exclusive{/if}{if $hasLeftPanel} aside-active{/if}" tabindex="-1">
        {opcMountPoint id='opc_before_main' inContainer=false}
        {/block}
    {/if}

    {if JTL\Session\Frontend::getCustomer()->getID() === 0 && ($nSeitenTyp !== 14 && $nSeitenTyp !== 18 && $nSeitenTyp !== 4)}
        {block name='layout-header-fluid-banner'}
        {/block}
    {else}
        {block name='layout-header-fluid-banner'}
        {assign var=isFluidBanner value=$Einstellungen.template.theme.banner_full_width === 'Y' && isset($oImageMap)}
        {if $isFluidBanner}
            {block name='layout-header-fluid-banner-include-banner'}
                {include file='snippets/banner.tpl' isFluid=true}
            {/block}
        {/if}
        {assign var=isFluidSlider value=$Einstellungen.template.theme.slider_full_width === 'Y' && isset($oSlider) && count($oSlider->getSlides()) > 0}
        {if $isFluidSlider}
            {block name='layout-header-fluid-banner-include-slider'}
                {include file='snippets/slider.tpl' isFluid=true}
            {/block}
        {/if}
        {/block}
    {/if}

    {if JTL\Session\Frontend::getCustomer()->getID() === 0 && ($nSeitenTyp !== 14 && $nSeitenTyp !== 18 && $nSeitenTyp !== 4 && $nSeitenTyp !== 20)}
        {block name='layout-header-content-all-starttags'}
        {/block}
    {else}
        {block name='layout-header-content-all-starttags'}
            {block name='layout-header-content-wrapper-starttag'}
                <div id="content-wrapper"
                     class="{if ($Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive) || $smarty.const.PAGE_ARTIKELLISTE === $nSeitenTyp}has-left-sidebar container-fluid container-fluid-xl{/if}
                     {if $smarty.const.PAGE_ARTIKELLISTE === $nSeitenTyp}is-item-list{/if}
                            {if $isFluidBanner || $isFluidSlider} has-fluid{/if}">
            {/block}
    
            {block name='layout-header-breadcrumb'}
                {container
                    fluid=(($Einstellungen.template.theme.left_sidebar === 'Y' &&
                        $boxesLeftActive) || $smarty.const.PAGE_ARTIKELLISTE === $nSeitenTyp ||
                        (isset($Link) && $Link->getIsFluid()))
                    class="breadcrumb-container"
                }
                    {include file='layout/breadcrumb.tpl'}
                {/container}
            {/block}
    
            {block name='layout-header-content-starttag'}
                <div id="content">
            {/block}
    
            {if !$bExclusive && $boxes.left !== null && !empty(trim(strip_tags($boxes.left))) && (($Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive) || $smarty.const.PAGE_ARTIKELLISTE === $nSeitenTyp)}
                {block name='layout-header-content-productlist-starttags'}
                    <div class="row justify-content-lg-end">
                        <div class="col-lg-8 col-xl-9 ml-auto-util ">
                {/block}
            {/if}
    
            {block name='layout-header-alert'}
                {include file='snippets/alert_list.tpl'}
            {/block}
    
        {/block}{* /content-all-starttags *}
    {/if}
{/if}

