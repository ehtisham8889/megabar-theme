{block name='layout-footer-boxes' prepend}
    <div class="payment-shipping">
        <div id="smoke2u-payment-shipping-footer-hook"></div>
    </div>
{/block}
{block name='layout-footer-copyright' prepend}
    {if $isMobile}
        <div class="bg-primary smokefooter w-100">
                <div class="container">
                    <div class="row" id="whatsapprow">
                    {if !empty($Einstellungen.template.smokefootersettings.walink) &&  !empty($Einstellungen.template.smokefootersettings.watext)}
                        <div class="col-6">
                            <a href="{$Einstellungen.template.smokefootersettings.walink}" class="btn btn-black iconxl">
                                <div class="d-flex align-center">
                                    <i class="icon-whatsapp text-primary"></i>
                                    <span class="d-block">{$Einstellungen.template.smokefootersettings.watext}</span>
                                </div>
                            </a>
                        </div>
                    {/if}
                    {if !empty($Einstellungen.template.smokefootersettings.walink) &&  !empty($Einstellungen.template.smokefootersettings.watext)}
                        <div class="col-6">
                            <a href="{$Einstellungen.template.smokefootersettings.emlink}" class="btn btn-black iconxl">
                                <div class="d-flex align-center"> 
                                    <i class="far fa-envelope-open text-primary"></i>
                                    <span class="d-block">{$Einstellungen.template.smokefootersettings.emtext}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                    {/if}
                    <div class="row" id="logorow">
                        <div id="smoke2u-footer-stores"></div> 
                    </div>
                </div>
        </div>
    {/if}
{/block} 

{block name='layout-footer-newsletter' prepend}
    {if !$isMobile}
    <div class="container-fluid container-fluid-xl">
        <div class="row">
            <div class="col-6">
    {/if}
{/block}

{block name='footer-vat-notice' append}
    
    {if !$isMobile}
            </div>
        </div>
        <div class="col-6">
        <div class="bg-primary smokefooter">
                <div class="container">
                    <div class="row" id="whatsapprow">
                    {if !empty($Einstellungen.template.smokefootersettings.walink) &&  !empty($Einstellungen.template.smokefootersettings.watext)}
                        <div class="col-6">
                            <a href="{$Einstellungen.template.smokefootersettings.walink}" class="btn btn-black iconxl">
                                <div class="d-flex align-center">
                                    <i class="icon-whatsapp text-primary"></i>
                                    <span class="d-block">{$Einstellungen.template.smokefootersettings.watext}</span>
                                </div>
                            </a>
                        </div>
                    {/if}
                    {if !empty($Einstellungen.template.smokefootersettings.walink) &&  !empty($Einstellungen.template.smokefootersettings.watext)}
                        <div class="col-6">
                            <a href="{$Einstellungen.template.smokefootersettings.emlink}" class="btn btn-black iconxl">
                                <div class="d-flex align-center"> 
                                    <i class="far fa-envelope-open text-primary"></i>
                                    <span class="d-block">{$Einstellungen.template.smokefootersettings.emtext}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                    {/if}
                    <div class="row" id="logorow">
                        <div id="smoke2u-footer-stores"></div> 
                    </div>
                </div>
        </div>
    {/if}
{/block}
{block name='footer-vat-notice'}
     {block name='layout-footer-withdrawal-add'}
                        {row class="withdrawal-link-wrapper mb-3"}
                            {col cols=12 sm=6 md=4 lg=3}
                                {include file='snippets/withdrawal_link.tpl'}
                            {/col}
                        {/row}
                    {/block}
    <div class="text-white position-relative pb-2">
    {if $NettoPreise == 1}
        {lang key='footnoteExclusiveVat' assign='footnoteVat'}
    {else}
        {lang key='footnoteInclusiveVat' assign='footnoteVat'}
    {/if}
    {if isset($oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND])}
        {if $Einstellungen.global.global_versandhinweis === 'zzgl'}
            {lang key='footnoteExclusiveShipping' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL() assign='footnoteShipping'}
        {elseif $Einstellungen.global.global_versandhinweis === 'inkl'}
            {lang key='footnoteInclusiveShipping' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_VERSAND]->getURL() assign='footnoteShipping'}
        {/if}
    {/if}
   
        <span class="small">* {$footnoteVat}{if isset($footnoteShipping)}{$footnoteShipping}{/if}</span>

    </div>
{/block}

{block name='layout-footer-copyright'}
    <div id="copyright" class="position-relative text-white">
        {container fluid=true}
            {row}
                {assign var=isBrandFree value=JTL\Shop::isBrandfree()}
                {block name='layout-footer-copyright-copyright'}
                    {col}
                        {if !empty($meta_copyright)}
                            <span class="icon-mr-2" itemprop="copyrightHolder">&copy; {$meta_copyright}</span>
                        {/if}
                        {if $Einstellungen.global.global_zaehler_anzeigen === 'Y'}
                            {lang key='counter'}: {$Besucherzaehler}
                        {/if}
                        {if !empty($Einstellungen.global.global_fusszeilehinweis)}
                            <span class="ml-2">{$Einstellungen.global.global_fusszeilehinweis}</span>
                        {/if}
                    {/col}
                {/block}
                {if !$isBrandFree}
                    {block name='layout-footer-copyright-brand'}
                        {col cols=12 md="auto" class="ml-auto-util{if $Einstellungen.template.theme.button_scroll_top === 'Y'} pr-md-8{/if}" id="system-credits"}
                            Powered by {link href="https://jtl-url.de/jtlshop" class="text-white text-decoration-underline" title="JTL-Shop" target="_blank" rel="noopener nofollow"}JTL-Shop{/link}
                        {/col}
                    {/block}
                {/if}
            {/row}
        {/container}
    </div>
    {if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
        <script src="{$ShopURL}/templates/Megabar/js/goeb2b.js" crossorigin="anonymous"></script>
    {/if}
{/block}


{block name='layout-footer-content-productlist-row-closingtag'}
    {if $boxesLeftActive}
    <div id="leftBoxesHook"></div>
    <div id="dropper-cat-hook-after-content"></div>

        {if $Einstellungen.navigationsfilter.kategorie_beschreibung_anzeigen === 'Y'
            && $oNavigationsinfo->getCategory() !== null
            && $oNavigationsinfo->getCategory()->getDescription()|strlen > 0}
            {block name='productlist-footer-seo-description-category'}
                <div class="desc seo">
                    <p>{$oNavigationsinfo->getCategory()->getDescription()}</p>
                </div>
            {/block}
        {/if}

    </div>

    {else}
        </div>{* /row *}
        
    {/if}
{/block}
{block name='layout-footer-withdrawal'}{/block}