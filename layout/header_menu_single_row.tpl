{block name='layout-header-menu-single-row-include-header-nav-search'}

    {if !$isMobile}
        {col class="main-search-wrapper nav-right {if $Einstellungen.template.header.menu_logo_centered === 'Y'}order-lg-1{else}order-lg-2{/if}"}
            {include file='snippets/header_addition.tpl'}
            {if $Einstellungen.template.smokesearch.searchtype === "default"}
                {include file='layout/header_nav_search.tpl'}
            {else}
               <button type="button" id="doofindericon" class="align-content-center btn btn-link p-0 border-0" aria-label="Suche öffnen" onclick="document.body.classList.toggle('mb-search-open');var i=document.querySelector('#mb-search-box input[name=qs]');if(i)i.focus();return false;">
    <i class="fas fa-search faxl"></i>
</button>
                <div id="mb-search-box">
                    {include file='snippets/search_form.tpl' id='mb-search'}
                </div>
            {/if}
        {/col}
    {/if}
{/block}

{block name='layout-header-menu-single-row-logo' prepend}

    {if $isMobile}
        {col class="main-search-wrapper nav-right {if $Einstellungen.template.header.menu_logo_centered === 'Y'}order-lg-1{else}order-lg-2{/if}"}
            <ul class="nav nav-right order-lg-last nav-icons pl-3">
            <li class="toggler-logo-wrapper">
                {block name='layout-header-logo-navbar-toggle'}
                    <button id="burger-menu" class="burger-menu-wrapper navbar-toggler collapsed {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}d-none{/if}" type="button" data-toggle="collapse" data-target="#mainNavigation" aria-controls="mainNavigation" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                {/block}
            </li>
            {if $Einstellungen.template.smokesearch.searchtype === "default"}
                {include file='layout/header_nav_search.tpl'}
            {else}
                <li class="nav-item">
                    <button type="button" id="doofindericon" class="align-content-center btn btn-link p-0 border-0" aria-label="Suche öffnen" onclick="document.body.classList.toggle('mb-search-open');var i=document.querySelector('#mb-search-box input[name=qs]');if(i)i.focus();return false;">
    <i class="fas fa-search faxl"></i>
</button>
                    <div id="mb-search-box">
                        {include file='snippets/search_form.tpl' id='mb-search'}
                    </div>
                </li>
            {/if}
            </ul>
        {/col}
    {/if}

{/block}

{block name='layout-header-menu-single-row-secure-checkout'}
    <div class="cart-header-checkout">
        <a href="{get_static_route id='warenkorb.php'}" class="btn btn-outline-primary btn-sm text-uppercase">{lang key="backToBasket" section="checkout"}</a>
    </div>
{/block}