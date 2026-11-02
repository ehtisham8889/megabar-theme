

{block name='productdetails-basket' prepend}
    {if $Artikel->nErscheinendesProdukt} 
        <div class="alert preorder coming_soon text-center-util">
            {lang key='productAvailableFrom' section='global'}: <strong>{$Artikel->Erscheinungsdatum_de}</strong>
            {if $Einstellungen.global.global_erscheinende_kaeuflich === 'Y' && $Artikel->inWarenkorbLegbar == 1}
                ({lang key='preorderPossible' section='global'})
            {/if}
        </div>
    {/if}
{/block}

{block name='productdetails-basket-coming-soon'}
{/block}

{block name='productdetails-basket-quantity'}

     {$step = 1}
    {if $Artikel->cTeilbar === 'Y' && $interval == 0}
        {$step = 'any'}
    {elseif $interval > 0}
        {$step = $interval}
    {/if}
    {$inputValue = 1}
    {if $interval > 0 || $mbm > 1}
        {$inputValue = max($mbm,$interval)}
    {elseif isset($fAnzahl)}
        {$inputValue = $fAnzahl}
    {/if}
    {$pid = $Artikel->kVariKindArtikel|default:$Artikel->kArtikel}

    {assign var="maxBestell" value=$Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]|default:$Artikel->fLagerbestand}
    {assign var="maxVielfaches" value=($maxBestell / $step)|floor*$step}

    {if $maxVielfaches > 0}
        <div class="col-12 alert alert-info">
        Die maximal mögliche Abnahmemenge entspricht aktuell <b>{$maxVielfaches} {if empty($Artikel->cEinheit)}Einheiten{else}{$Artikel->cEinheit}{/if}</b>.
        </div>
    {/if}
    {col cols=4 class="pr-0 mb-0 {if $maxVielfaches == 0 && $step > 0 && $Artikel->cLagerKleinerNull == "N"}d-none{/if}"}
        {inputgroup id="quantity-grp" class="form-counter choose_quantity"}
            {inputgroupprepend}
                {button variant=""
                    data=["count-down"=>""]
                    aria=["label"=>{lang key='decreaseQuantity' section='aria'}]}
                    <span class="fas fa-minus"></span>
                {/button}
            {/inputgroupprepend}

            
            {input type="number"
                min=$mbm
                max=$maxVielfaches|default:$Artikel->fLagerbestand
                required=($interval > 0)
                step=$step
                id="quantity" class="quantity pr-0 pl-0" name="anzahl"
                aria=["label"=>"{lang key='quantity'}"]
                value=$inputValue
                data=[
                    "data-max-fattr" => {$Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]},
                    "data-lagerbestand" => {$Artikel->fLagerbestand},
                    "data-max" => {$maxVielfaches},
                    "decimals"=>{getDecimalLength quantity=$interval},
                    "product-id"=>"{$pid}"
                ]
            }
            {inputgroupappend}
                {if $Artikel->cEinheit}
                    {inputgrouptext class="unit d-none form-control"}
                        {$Artikel->cEinheit}
                    {/inputgrouptext}
                {/if}
                {button variant=""
                    data=["count-up"=>""]
                    aria=["label"=>{lang key='increaseQuantity' section='aria'}]}
                    <span class="fas fa-plus"></span>
                {/button}
            {/inputgroupappend}
        {/inputgroup}
    {/col}

{/block}

{block name='productdetails-basket-add-to-cart'}
 {$step = 1}
    {if $Artikel->cTeilbar === 'Y' && $interval == 0}
        {$step = 'any'}
    {elseif $interval > 0}
        {$step = $interval}
    {/if}
    {$inputValue = 1}
    {if $interval > 0 || $mbm > 1}
        {$inputValue = max($mbm,$interval)}
    {elseif isset($fAnzahl)}
        {$inputValue = $fAnzahl}
    {/if}
    {$pid = $Artikel->kVariKindArtikel|default:$Artikel->kArtikel}

    {assign var="maxBestell" value=$Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]|default:$Artikel->fLagerbestand}
    {assign var="maxVielfaches" value=($maxBestell / $step)|floor*$step}
    {if $step > 0}
        {assign var="maxVielfaches" value=($maxBestell / $step)|floor*$step}
    {else}
        {assign var="maxVielfaches" value=0}
    {/if}
    {col cols=8 class="pl-0 {if $maxVielfaches == 0 && $step > 0 && $Artikel->cLagerKleinerNull == "N"}d-none{/if}"}
        {button aria=["label"=>"{lang key='addToCart'}"]
            block=true name="inWarenkorb"
            type="submit"
            value="{lang key='addToCart'}"
            variant="primary"
            disabled=$Artikel->bHasKonfig && !$isConfigCorrect|default:false
            class="js-cfg-validate"}
            <span class="btn-basket-check">
                {*<i class="fas fa-shopping-cart"></i>*}
                {if isset($kEditKonfig)}
                    {lang key='applyChanges'}
                {else}
                    {lang key='addToCart'}
                {/if}
            </span>
            <svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
                <path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
            </svg>
        {/button}
        {if isset($kEditKonfig)}
            <input type="hidden" name="kEditKonfig" value="{$kEditKonfig}"/>
        {/if}
        
    {/col} 
    {if $maxVielfaches == 0 && $step > 0 && $Artikel->cLagerKleinerNull == "N"} 
        <div class="col-12 alert alert-warning"> 
            Die Mindestabnahmemenge von <b>{$step} {$Artikel->cEinheit}</b> ist für dieses Produkt aktuell leider nicht auf Lager.
        </div> 
    {/if}
{/block}
{block name='productdetails-basket-form-inline' append}
    <div id="ppchook"></div>
{/block}


{block name='productdetails-basket-alert-purchase-info'}
    {alert variant="info" class="purchase-info text-center"}
        {assign var=units value=$Artikel->cEinheit}
        {if empty($Artikel->cEinheit) || $Artikel->cEinheit|strlen == 0}
            <span>{lang key='units' section='productDetails' assign='units'}</span>
        {/if}

        {if $mbm > 1 || ($mbm > 0 && $Artikel->cTeilbar === 'Y')}
            {lang key='minimumPurchase' section='productDetails' assign='minimumPurchase'}
            <span>{$minimumPurchase|replace:"%d":$mbm|replace:"%s":$units}</span>
        {/if}

        {if $interval > 0}
            {lang key='takeHeedOfInterval' section='productDetails' assign='takeHeedOfInterval'}
            <span id="intervall-notice" {if $Einstellungen.artikeldetails.artikeldetails_artikelintervall_anzeigen !== 'Y'}class="d-none"{/if}>{$takeHeedOfInterval|replace:"%d":$interval|replace:"%s":$units}</span>
        {/if}

        {if $Artikel->cTeilbar === 'Y'}
            <span>{lang key='integralQuantities' section='productDetails'}</span>
        {/if}
        {if $Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]|default:0 > 0}
            {lang key='maximalPurchase' section='productDetails' assign='maximalPurchase'}
            <span>{$maximalPurchase|replace:"%d":$Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]|replace:"%s":$units}</span>
        {/if}
    {/alert}
{/block}