{if JTL\Session\Frontend::getCustomer()->getID() === 0 &&  $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
    {block name='productlist-index'}
        {*not logged in *}
        {include file='layout/header.tpl' hLogin="ja"}
        {include file='snippets/b2b_login.tpl'}
    {/block}
{else}
{block name='productlist-index'}
    {block name='productlist-index-include-header'}
        {if !isset($bAjaxRequest) || !$bAjaxRequest}
            {include file='layout/header.tpl'}
        {/if}
    {/block}

    {block name='productlist-index-content'}
    
        <div id="dropper-cat-hook-before-content"></div>
        
        <div id="result-wrapper" data-wrapper="true">
            {block name='productlist-index-include-productlist-header'}
                {include file='productlist/header.tpl'}
            {/block}
            {container id="prodlist-kata"}
                {*Prio: -> Funktionsattribut -> Benutzereingabe -> Standarddarstellung*}
                {block name='productlist-index-include-productlist-header-grid'}
                    {if (!empty($AktuelleKategorie->getCategoryFunctionAttribute('darstellung'))
                        && $AktuelleKategorie->getCategoryFunctionAttribute('darstellung') == 1)
                        || (empty($AktuelleKategorie->getCategoryFunctionAttribute('darstellung'))
                            && ((!empty($oErweiterteDarstellung->nDarstellung) && $oErweiterteDarstellung->nDarstellung == 1)
                                || (empty($oErweiterteDarstellung->nDarstellung)
                                    && isset($Einstellungen.artikeluebersicht.artikeluebersicht_erw_darstellung_stdansicht)
                                    && $Einstellungen.artikeluebersicht.artikeluebersicht_erw_darstellung_stdansicht == 1))
                    )}
                        {block name='productlist-index-include-productlist-header-grid-list'}
                            {assign var=style value='list'}
                            {assign var=grid value='6'}
                            {assign var=gridmd value='12'}
                        {/block}
                    {else}
                        {block name='productlist-index-include-productlist-header-grid-gallery'}
                             {if $boxesLeftActive}
                                   
                                  {assign var=style value='gallery'}
                                    {assign var=grid value='6'}
                                    {assign var=gridsm value='6'}
                                    {assign var=gridmd value='4'}
                                    {assign var=gridxl value='3'}
                                    {if !$bExclusive || empty($boxes.left)}
                                        {assign var=gridmd value='4'}
                                    {/if}
                             {else}
                                
                                {assign var=style value='gallery'}
                                {assign var=grid value='6'}
                                {assign var=gridsm value='6'}
                                {assign var=gridmd value='3'}
                                {assign var=gridxl value='2'}
                                {if !$bExclusive || empty($boxes.left)}
                                    {assign var=gridmd value='4'}
                                {/if}
                            {/if}
                        {/block}
                    {/if}
                {/block}

                {block name='productlist-index-list-type'}
                    <input type="hidden" id="product-list-type" value="{$style}">
                {/block}

                {if !empty($Suchergebnisse->getError())}
                    {block name='productlist-index-alert'}
                        {alert variant="danger"}{$Suchergebnisse->getError()}{/alert}
                    {/block}
                {/if}
                {if isset($oBestseller_arr) && $oBestseller_arr|count > 0}
                    {block name='productlist-index-include-product-slider'}
                        {opcMountPoint id='opc_before_bestseller'}
                        {lang key='bestseller' section='global' assign='slidertitle'}
                        {include file='snippets/product_slider.tpl' id='slider-top-products' productlist=$oBestseller_arr title=$slidertitle}
                    {/block}
                {/if}

                {block name='productlist-index-products'}
                
                    {block name='smoke2u-catfunctions'}
                    
                        {if isset($AktuelleKategorie->getCategoryFunctionAttribute("sale-banner-typ")) && !empty($AktuelleKategorie->getCategoryFunctionAttribute("sale-banner-typ"))}
                            {assign var="saleBannerType" value={$AktuelleKategorie->getCategoryFunctionAttribute("sale-banner-typ")}}
                            {if isset($AktuelleKategorie->getCategoryFunctionAttribute("sale-banner-inhalt")) && !empty($AktuelleKategorie->getCategoryFunctionAttribute("sale-banner-inhalt"))}
                                {assign var="saleBannerContent" value="{$AktuelleKategorie->getCategoryFunctionAttribute("sale-banner-inhalt")}"}
                            {/if}
                            {if $saleBannerType == "Artikel"}
                                {assign var="saleBannerArticles" value=","|explode:"{$saleBannerContent}"}
                            {/if}
                            {if $saleBannerType == "Text"}
                                
                            {/if}
                            {if $saleBannerType == "Custom"}
                                
                            {/if}
                            {if isset({$AktuelleKategorie->getCategoryFunctionAttribute("kategoriebanner")}) && !empty({$AktuelleKategorie->getCategoryFunctionAttribute("kategoriebanner")})}
                                {assign var="saleBannerHeader" value="{$AktuelleKategorie->getCategoryFunctionAttribute("kategoriebanner")}"}
                            {/if}
                        {/if}

                    {/block}
                    
                    {assign var="randomItem1" value="1"|mt_rand:10}
                    {assign var="randomItem2" value=$randomItem1|mt_rand:18}
                    {assign var="saleRandomItem" value="1"|mt_rand:15}
                        <div class="d-none">{$randomItem1}{$randomItem2}</div>
                        {if $Suchergebnisse->getProducts()|count > 0}
                        {opcMountPoint id='opc_before_products'}
                        {row class="product-list layout-{if $style === 'list' && (!$isMobile || $isTablet)}list{else}$style{/if}" id="product-list" itemprop="mainEntity" itemscope=true itemtype="https://schema.org/ItemList"}
                            {foreach $Suchergebnisse->getProducts() as $Artikel}
                                {assign var="iterationMultiplier" value=10}
                                {assign var="iteration" value={$Artikel@iteration}}
                                {math equation="x / y" x=$iteration y=$iterationMultiplier assign="iterationDelay"}
                                {if $isMobile && !$isTablet}
                                    {if $Artikel@iteration <= 4}
                                        {assign var="iterationString" value={$iterationDelay|cat:"s"}}
                                    {else}
                                        {assign var="iterationString" value=".25s"}
                                    {/if}
                                {/if}
                                {if $isMobile && $isTablet}
                                    {if $Artikel@iteration <= 6}
                                        {assign var="iterationString" value={$iterationDelay|cat:"s"}}
                                    {else}
                                        {assign var="iterationString" value=".25s"}
                                    {/if}
                                {/if}
                                {if !$isMobile && !$isTablet}
                                    {if $Artikel@iteration <= 10}
                                        {assign var="iterationString" value={$iterationDelay|cat:"s"}}
                                    {else}
                                        {assign var="iterationString" value=".25s"}
                                    {/if}
                                {/if}
                                
                                {col cols={$grid} md="{if isset($gridmd)}{$gridmd}{/if}"
                                    sm="{if isset($gridsm)}{$gridsm}{/if}" xl="{if isset($gridxl)}{$gridxl}{/if}"
                                    data=['wow-delay'=>{$iterationString}]
                                    class="product-wrapper {if $Artikel@iteration == $randomItem1}product-banner-01{/if}{if $Artikel@iteration == $randomItem2}product-banner-02{/if} wow fadeIn"
                                    itemprop="itemListElement" itemscope=true itemtype="https://schema.org/Product"}
                                    {if $style === 'list' && (!$isMobile || $isTablet)}
                                        {block name='productlist-index-include-item-list'}
                                            {include file='productlist/item_list.tpl' tplscope=$style}
                                        {/block}
                                    {else}
                                        {block name='productlist-index-include-item-box'}
                                            {include file='productlist/item_box.tpl' tplscope=$style}
                                        {/block}
                                    {/if}
                                {/col}
                                {*if $Artikel@iteration == $saleRandomItem}
                                {col cols={$grid} md="{if isset($gridmd)}{$gridmd}{/if}"
                                    sm="{if isset($gridsm)}{$gridsm}{/if}" xl="{if isset($gridxl)}{$gridxl}{/if}"
                                    data=['wow-delay'=>{$iterationString}]
                                    class="product-wrapper product-sale sale-banner sale-{$saleBannerType}  wow fadeIn"}
                                    <div class="banner-inner">
                                        <div class="banner-header">
                                            {$saleBannerHeader}
                                        </div>
                                        <div class="banner-rte">
                                            {if $saleBannerType == "Artikel"}
                                                {$saleBannerArticles|var_dump}
                                            {elseif $saleBannerType == "Text"}
                                                {$saleBannerContent}
                                            {else}
                                                {$saleBannerContent}
                                            {/if}
                                        </div>
                                    </div>
                                        
                                        
                                {/col}
                                {/if*}
                            {/foreach}
                        {/row}
                        {/if}
                    
                {/block}
            {/container}

            {block name='productlist-index-include-productlist-footer'}
                {include file='productlist/footer.tpl'}
            {/block}
        </div>

    {/block}

    {block name='productlist-index-include-footer'}
        {if !isset($bAjaxRequest) || !$bAjaxRequest}
            {include file='layout/footer.tpl'}
        {/if}
    {/block}
{/block}

{* overrides to force gallery all the time *}
{block name='productlist-index-include-productlist-header-grid-list'}
    {assign var=style value='gallery'}
    {assign var=grid value='6'}
    {assign var=gridsm value='6'}
    {assign var=gridmd value='4'}
    {assign var=gridxl value='3'}
    {if !$bExclusive || empty($boxes.left)}
        {assign var=gridmd value='4'}
    {/if}
{/block}

{block name='productlist-index-include-item-list'}
    {include file='productlist/item_box.tpl' tplscope=$style}
{/block}
{/if}