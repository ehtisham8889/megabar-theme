{if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
    {block name='productdetails-pushed-success'}
        <div id="pushed-success" {if $card}role="alert" class="alert alert-dismissable"{/if}>
            {if $card}
                {block name='productdetails-pushed-success-cart-note-heading'}
                    <div class="card-header alert-success">
                        {if isset($cartNote)}
                            {$cartNote}
                        {/if}
                    </div>
                {/block}
            {/if}
        </div>
    {/block}
{else}
    {block name='productdetails-pushed-success'}
        <div data-wow-delay=".5s" id="pushed-success" {if $card}role="alert" class="alert alert-dismissable wow bounceInDown"{/if}>
            <div class="pushed-inner bg-white">
            {if isset($zuletztInWarenkorbGelegterArtikel)}
                {assign var=pushedArtikel value=$zuletztInWarenkorbGelegterArtikel}
            {else}
                {assign var=pushedArtikel value=$Artikel}
            {/if}
            {assign var=showXSellingCart value=isset($Xselling->Kauf) && count($Xselling->Kauf->Artikel) > 0}
            {if $card}
                {block name='productdetails-pushed-success-cart-note-heading'}
                    <div class="card-header alert-success">
                        {if isset($cartNote)}
                            {$cartNote}
                        {/if}
                    </div>
                {/block}
                <div class="card-body">
            {/if}

            {row}
            {block name='productdetails-pushed-success-product-cell'}
                {col cols=12}
                    <div class="push-outer">
                        {block name='productdetails-pushed-success-product-cell-content'}
                            <div class="productbox-push {if $showXSellingCart}with-cart{/if}">
                                {row}
                                    {col cols=12}
                                        {block name='productdetails-pushed-success-product-cell-subheading'}
                                            <div class="productbox-title subheadline">{$pushedArtikel->cName}</div>
                                        {/block}
                                    {/col}
                                    {col cols=12 class="pushed-success-image-wrapper"}
                                        {block name='productdetails-pushed-success-product-cell-image'}
                                            {include file='snippets/image.tpl'
                                                item=$pushedArtikel
                                                square=false
                                                class='image w-100'
                                                srcSize='sm'}
                                        {/block}
                                    {/col}
                                    {col}
                                        {block name='productdetails-pushed-success-product-cell-details'}
                                        
                                        {/block}
                                    {/col}
                                {/row}
                            </div>
                        {/block}
                        {block name='productdetails-pushed-success-x-sell-inner'}
                            <div class="xsell-push">
                                {if $showXSellingCart}
                                    {row}
                                        {col cols=12 class="x-selling"}
                                            {row}
                                                {col cols=12}
                                                    {block name='productdetails-pushed-success-x-sell-heading'}
                                                        <div class="productbox-title subheadline">{lang key='customerWhoBoughtXBoughtAlsoY' section='productDetails'}</div>
                                                    {/block}
                                                {/col}
                                                {col cols=12}
                                                    {block name='productdetails-pushed-success-include-product-slider'}
                                                        {include file='snippets/product_slider.tpl' id='' productlist=$Xselling->Kauf->Artikel title='' tplscope="push"}
                                                    {/block}
                                                {/col}
                                            {/row}
                                        {/col}
                                    {/row}
                                {/if}
                            </div>
                        {/block}
                    </div>
                    {block name='productdetails-pushed-success-product-cell-links'}
                        {row class="pushed-success-buttons pt-3 mt-3"}
                            {col cols=12 md=6}
                                {link href="#" attribs=["onclick"=>"javascript:history.back()"]
                                    class="btn btn-outline-primary btn-block continue-shopping"
                                    data=["dismiss"=>"{if !$card}modal{/if}"]
                                    aria=["label"=>"Close"]}
                                    <i class="fa fa-arrow-circle-left"></i> {lang key='continueShopping' section='checkout'}
                                {/link}
                            {/col}
                            {col cols=12 md=6}
                                {link href="{get_static_route id='warenkorb.php'}"
                                    class="btn btn-primary btn-basket btn-block"}
                                    <i class="fas fa-shopping-cart"></i> {lang key='gotoBasket'}
                                {/link}
                            {/col}
                        {/row}
                    {/block}
                {/col}
            {/block}
            {block name='productdetails-pushed-success-x-sell'}
            {/block}
            {/row}
        {if $card}</div>{/if}
        </div>
    </div>
    {/block}
{/if}