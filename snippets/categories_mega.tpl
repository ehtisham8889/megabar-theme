{block name='snippets-categories-mega-wishlist'}
{if $Einstellungen.global.global_wunschliste_anzeigen === 'Y'}
    {navitem href="{get_static_route id='wunschliste.php'}" class="wl-nav-scrollbar-item nav-scrollbar-item justify-content-start"}
        <i class="fas fa-heart"> </i>{lang key='wishlist'}
        {badge id="badge-wl-count" variant="primary" class="product-count"}
            {if \JTL\Session\Frontend::getWishlist()->getID() > 0}
                {\JTL\Session\Frontend::getWishlist()->getItems()|count}
            {else}
                0
            {/if}
        {/badge}
    {/navitem}
{/if}
{/block}
{block name='snippets-categories-mega-comparelist'}
{if $Einstellungen.vergleichsliste.vergleichsliste_anzeigen === 'Y'}
    {navitem href="{get_static_route id='vergleichsliste.php'}" class="comparelist-nav-scrollbar-item nav-scrollbar-item justify-content-start"}
        <i class="fas fa-list"> </i> {lang key='compare'}
        {badge id="comparelist-badge" variant="primary" class="product-count"}
            {count(JTL\Session\Frontend::getCompareList()->oArtikel_arr)}
        {/badge}
    {/navitem}
{/if}

{get_static_route id='jtl.php' secure=true assign='secureAccountURL'}
{if JTL\Session\Frontend::getCustomer()->getID() === 0}
    {navitem href=$secureAccountURL title="{lang key='myAccount'}"}
        {lang key='loginOrRegister' section="custom"}
    {/navitem}
{else}
    
    {navitem href=$secureAccountURL title="{lang key='myAccount'}" class="justify-content-start"}
        <i class="fas fa-user"></i> {lang key='myAccount'}
    {/navitem}
    {navitem href="{$secureAccountURL}?bestellungen=1" title="{lang key='myAccount'}" class="justify-content-start"}
        <i class="fas fa-box"></i> {lang key='myOrders'}
    {/navitem}
    {navitem href="{$secureAccountURL}?editRechnungsadresse=1" title="{lang key='myAccount'}" class="justify-content-start"}
        <i class="fas fa-id-card"></i> {lang key='myPersonalData'}
    {/navitem}
    {navitem href="{$secureAccountURL}?editLieferadresse=1" title="{lang key='myAccount'}" class="justify-content-start"}
        <i class="fas fa-file-import"></i> {lang key='myShippingAddresses'}
    {/navitem}
    {navitem href="{$secureAccountURL}?logout=1" title="{lang key='logOut'}" class="account-icon-dropdown-logout" class="justify-content-start"}
        <i class="fas fa-sign-out-alt"></i> {lang key='logOut'}
    {/navitem}

{/if}
<li class="d-lg-none"><hr></li>
{/block}