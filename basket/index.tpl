{block name='basket-index-heading'}
    <h1 class="h2 basket-heading"><strong>{lang key='basket'}</strong> (<span class="text-primary">{$WarenkorbArtikelAnzahl}</span> {lang key='products'})</h1>
{/block}

{block name='basket-index-basket-xsell'}
    {if $isMobile}
        {card class='card-gray xsellcard' no-body=true}
       
            {block name='basket-index-xsell-available'}
                {cardheader}
                {block name='basket-index-xsell-heading'}
                    <strong class="font-size-lg" data-toggle="collapse" data-target="#xsell-card" id="xsm">{lang key='basketCustomerWhoBoughtXBoughtAlsoY'}</strong>
                {/block}
                {/cardheader}
                {collapse id="xsell-card"}
                    {cardbody}
                    {block name='basket-index-include-product-slider'}
                        {include file='snippets/product_slider.tpl' productlist=$xselling->Kauf->Artikel title=$panelTitle tplscope="xselltop"}
                    {/block}
                    {/cardbody}
                {/collapse}
            {/block}

        {/card}
        <hr class="mt-3 mb-3">
    {else}
        {lang key='basketCustomerWhoBoughtXBoughtAlsoY' assign='panelTitle'}
        {block name='basket-index-include-product-slider'}
            {include file='snippets/product_slider.tpl' productlist=$xselling->Kauf->Artikel title=$panelTitle tplscope="xselltop"}
        {/block}
    {/if}
{/block}

{if $isMobile}
    {block name='basket-index-freegifts-heading'}
        
    {/block}
{else}
    {block name='basket-index-freegifts-heading'}
        {if $selectedFreegift === 0}
            <div id="freegift" class="h2 basket-heading hr-sect"><i class="fas fa-gift text-success"></i>&nbsp;{lang key='freeGiftFromOrderValueBasket'}</div>
        {else}
            <div id="freegift"  class="h2 basket-heading hr-sect">Gratisgeschenk ändern</div>
        {/if}
    {/block}
{/if}

{block name='basket-index-freegifts'}
    {$freeGiftProducts = []}
    {foreach $freeGifts as $freeGift}
        {$freeGiftProducts[] = $freeGift->getProduct()}
    {/foreach}
    {if $isMobile}
        

        {card class='card-gray' no-body=true}
       
            {block name='basket-index-coupon-available'}
                {cardheader}
                {block name='basket-index-coupon-heading'}
                    <strong class="font-size-lg" data-toggle="collapse" data-target="#freegift-card" id="geschenk">
                        {if $selectedFreegift === 0}
                            <i class="fas fa-gift text-success"></i> {lang key='freeGiftFromOrderValueBasket'}
                        {else}
                            <i class="fas fa-check"></i> Gratisgeschenk ändern
                        {/if}
                        
                    </strong>
                {/block}
                {/cardheader}
                {collapse id="freegift-card"}
                    {cardbody}
                    {block name='basket-index-freegift-card'}
                        {row id="freegift"
                        class="slick-smooth-loading carousel carousel-arrows-inside slick-lazy pb-3 slick-type-half{$additional}"
                        data=["slick-type"=>"slider-half"]}
                            {include file='snippets/slider_items.tpl' items=$freeGiftProducts type='freegift'}
                        
                        {/row}
                    {/block}
                    {/cardbody}
                {/collapse}
            {/block}

        {/card}
    {else}
        {lang key='freeGiftFromOrderValueBasket' assign='panelTitle'}
        {row id="freegift"
        class="slick-smooth-loading carousel carousel-arrows-inside slick-lazy slick-type-half{$additional}"
        data=["slick-type"=>"slider-half"]}
            {include file='snippets/slider_items.tpl' items=$freeGiftProducts type='freegift'}
        
        {/row}
    {/if}
      

{/block}

{block name='basket-index-form-shipping-calc'}
   {*hidden*}
{/block}


{block name='basket-index-proceed-button'}
    {if $freeGifts->count() > 0 && $selectedFreegift == 0}
        <a href="#freegift" class="mt-3 btn btn-primary btn-success d-block "><i class="fas fa-gift"></i>&nbsp;{lang key="checkoutGiftOffer" section="custom"}</a>
        <p class="text-center pb-0 pt-3 mb-0">oder</p>
        {link id="cart-checkout-btn" href="{get_static_route id='bestellvorgang.php'}?wk=1" class="btn btn-primary"}
            {lang key='checkoutNoGift' section='custom'}
        {/link}
    {else}
        {link id="cart-checkout-btn" href="{get_static_route id='bestellvorgang.php'}?wk=1" class="btn btn-primary"}
            {lang key='nextStepCheckout' section='checkout'}
        {/link}
    {/if}
{/block}

