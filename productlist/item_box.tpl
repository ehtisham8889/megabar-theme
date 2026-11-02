{*block name='productlist-item-box-image' prepend} auskommentiert black friday
    
    {if $Artikel->Preise->Sonderpreis_aktiv}
        <div class="black-friday-badge position-absolute">
            <img src="/bilder/custom_badge/smoke2u_black-friday_badge.png" alt="Black Friday Angebot für {$Artikel->cName}">
        </div>
    {/if}

{/block*}
{if $Artikel->nErscheinendesProdukt || $Artikel->fLagerbestand == 0}
    {block name='productlist-item-box-include-productlist-actions'}
    {/block}
{/if}
{block name='productlist-item-list-basket-details-variations'}
    {link class="btn btn-outline-primary btn-block" role="button" href=$Artikel->cURLFull}
        {lang key='details'}
    {/link}
{/block}

{block name='productlist-index-include-price' append}
    {block name='productlist-item-list-basket-details'}
        {if !$isOPC}
        <div class="added-to-cart-notice" data-lang="{lang key="pushedToCartItem" section="custom"}"></div>
        <div class="form-row productbox-onhover productbox-actions item-list-basket-details">
            {if ($Artikel->inWarenkorbLegbar === 1
                    || ($Artikel->nErscheinendesProdukt === 1 && $Einstellungen.global.global_erscheinende_kaeuflich === 'Y'))
                && (($Artikel->nIstVater === 0 && $Artikel->Variationen|count === 0)
                    || $hasOnlyListableVariations === 1)
                && !$Artikel->bHasKonfig
                && $Einstellungen.template.productlist.buy_productlist === 'Y'}
                {if $Artikel->nIstVater && $Artikel->kVaterArtikel == 0}
                    {col cols=12}
                        {block name='productlist-item-list-basket-details-variations'}
                            {alert variation="info" class="choose-variations text-left-util"}
                                {lang key='chooseVariations' section='messages'}
                            {/alert}
                        {/block}
                    {/col}
                {else}
                    {assign var="stepB" value="{$Artikel->fAbnahmeintervall|default:1}"}
                    {assign var="maxBestell" value=$Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]|default:$Artikel->fLagerbestand}
                    
                    {if $stepB > 0}
                        {assign var="maxVielfaches" value=($maxBestell / $stepB)|floor*$stepB}
                    {else}
                        {assign var="maxVielfaches" value=0}
                    {/if}

                    {col cols=6 md=5 class="pr-0 item-box-qty {if $maxVielfaches == 0 && $stepB > 0 && $Artikel->cLagerKleinerNull == "N"}d-none{/if}"}
                        {block name='productlist-item-list-basket-details-quantity'}
                            {inputgroup class="form-counter" data=["bulk" => {!empty($Artikel->staffelPreis_arr)}]}
                                {inputgroupprepend}
                                    {button variant=""
                                        data=["count-down"=>""]
                                        aria=["label"=>{lang key='decreaseQuantity' section='aria'}]}
                                        <span class="fas fa-minus"></span>
                                    {/button} 
                                {/inputgroupprepend}
                                
                                {input type="number" min="0"
                                    step="{if $Artikel->cTeilbar === 'Y' && $Artikel->fAbnahmeintervall == 0}any{elseif $Artikel->fAbnahmeintervall > 0}{$Artikel->fAbnahmeintervall}{else}1{/if}"
                                    min="{if $Artikel->fMindestbestellmenge}{$Artikel->fMindestbestellmenge}{else}0{/if}"
                                    max=$maxVielfaches|default:$Artikel->fLagerbestand
                                    id="{$idPrefix|default:''}quantity{$Artikel->kArtikel}"
                                    class="quantity pr-0 pl-0"
                                    name="anzahl"
                                    autocomplete="off"
                                    aria=["label"=>{lang key='quantity'}]
                                    data=[
                                        "decimals"=>{getDecimalLength quantity=$Artikel->fAbnahmeintervall},
                                        "product-id"=>"{if isset($Artikel->kVariKindArtikel)}{$Artikel->kVariKindArtikel}{else}{$Artikel->kArtikel}{/if}"
                                    ]
                                    value="{if $Artikel->fAbnahmeintervall > 0 || $Artikel->fMindestbestellmenge > 1}{if $Artikel->fMindestbestellmenge > $Artikel->fAbnahmeintervall}{$Artikel->fMindestbestellmenge}{else}{$Artikel->fAbnahmeintervall}{/if}{else}1{/if}"}
                                {inputgroupappend}
                                    {button variant=""
                                        data=["count-up"=>""]
                                    
                                        aria=["label"=>{lang key='increaseQuantity' section='aria'}]}
                                        <span class="fas fa-plus"></span>
                                    {/button}
                                {/inputgroupappend}
                            {/inputgroup}
                        {/block}
                    {/col}
                    {col cols=6 md=7 class="pl-0 item-box-cart-btn {if $maxVielfaches == 0 && $stepB > 0 && $Artikel->cLagerKleinerNull == "N"}d-none{/if}"} 
                        {block name='productlist-item-list-basket-details-add-to-cart'}
                            {button type="submit"
                                variant="primary"
                                block=true id="{$idPrefix|default:''}submit{$Artikel->kArtikel}"
                                title="{lang key='addToCart'}"
                                class="basket-details-add-to-cart mt-0"
                                aria=["label"=>{lang key='addToCart'}]}
                                <span>{lang key='addToCart'}</span> <i class="icon icon-warenkorb"></i>
                            {/button}
                        {/block}
                    {/col}
                    {if $maxVielfaches == 0 && $stepB > 0 && $Artikel->cLagerKleinerNull == "N"}
                        {col cols=12 class="detail-button-col"}
                        {block name='productlist-item-list-basket-details-details'}
                            {link class="btn btn-danger btn-block noticebtn data-step-{$stepB} data-max-vv-{$maxVielfaches}" role="button" href=$Artikel->cURLFull}
                               Keine Ausreichende Stückzahl auf Lager
                            {/link}
                        {/block}
                    {/col}
                    {/if}
                {/if}
            {else}
                
                    {if $Artikel->nErscheinendesProdukt}
                        {col cols=12 class="detail-button-col"}
                            {block name='productlist-item-list-basket-details-details'}
                                {link class="btn btn-outline-primary btn-block preorder" role="button" href=$Artikel->cURLFull}
                                    {lang key='productAvailableFrom' section='global'}: <strong>{$Artikel->Erscheinungsdatum_de}</strong>
                                {/link}
                            {/block}
                        {/col}
                    {else}
                        {col cols=12 class="detail-button-col"}
                            {block name='productlist-item-list-basket-details-details'}
                                {link class="btn btn-outline-primary btn-block" role="button" href=$Artikel->cURLFull}
                                    {lang key='details'}
                                {/link}
                            {/block}
                        {/col}
                    {/if}
                
            {/if}
        </div>
        {/if}
    {/block}
{/block}

{block name='productlist-item-box-caption' append}
      <div class="danger-symbol-array dangersym_smoke2u sym_right position-absolute megabar-skull">
        {$showDanger = false}
        {if isset($Artikel->oKategorie_arr) && !empty($Artikel->oKategorie_arr)}
            {foreach ['2346','2348','2334','2337','2340','2336','2339','2342','2344'] as $dangerCat}
                {if in_array($dangerCat, $Artikel->oKategorie_arr)}{$showDanger = true}{/if}
            {/foreach}
        {/if}
        {if $Artikel->kVersandklasse == "5" || $showDanger}
            <img src="/templates/Megabar/themes/smoke2u/gfx/gefahrensymbol_smoke2u.svg" width="75" height="75" alt="Gefahr!">
            <span>Gefahr!</span>
        {/if}
    </div>
{/block}