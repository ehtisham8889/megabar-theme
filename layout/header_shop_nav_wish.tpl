{block name='layout-header-shop-nav-wish-link'}
    {link class='nav-link' aria=['expanded' => 'false', 'label' => {lang key='wishlist'}] data=['toggle' => 'dropdown']}
        <i class="{if $wlCount === 0}far{else}text-primary fas{/if} fa-heart">
            <span id="badge-wl-count" class="fa-sup {if $wlCount === 0} d-none{/if}" title="{$wlCount}">
                {$wlCount}
            </span>
        </i>
    {/link}
{/block}