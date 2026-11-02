{block name='layout-footer-content'}
    {$newsletterActive = $Einstellungen.template.footer.newsletter_footer === 'Y'
                && $Einstellungen.newsletter.newsletter_active === 'Y'}
  
    {if $newsletterActive}
        <div class="container">
            {block name='layout-footer-newsletter'}
                {row class="newsletter-footer"}
                    {col cols=12 lg=6}
                        {block name='layout-footer-newsletter-heading'}
                            <div class="h2 newsletter-footer-heading">
                                {lang key='newsletter' section='newsletter'} {lang key='newsletterSendSubscribe' section='newsletter'}
                            </div>
                        {/block}
                        {if isset($oSpezialseiten_arr[$smarty.const.LINKTYP_DATENSCHUTZ])}
                        {block name='layout-footer-newsletter-info'}
                            <p class="info">
                                {lang key='newsletterInformedConsent' section='newsletter' printf=$oSpezialseiten_arr[$smarty.const.LINKTYP_DATENSCHUTZ]->getURL()}
                            </p>
                        {/block}
                        {/if}
                    {/col}
                    {col cols=12 lg=6}
                        {block name='layout-footer-form'}
                            {form method="post" action="{get_static_route id='newsletter.php'}"}
                                {block name='layout-footer-form-content'}
                                    {input type="hidden" name="abonnieren" value="2"}
                                    {formgroup class="newsletter-email-wrapper"
                                        label-for="newsletter_email"
                                        label="{lang key='newsletter' section='newsletter'} {lang key='newsletterSendSubscribe' section='newsletter'}"
                                        label-sr-only=true}
                                        {inputgroup}
                                            {input type="email" name="cEmail" id="newsletter_email" placeholder="{lang key='emailadress'}" autocomplete="email"}
                                            {inputgroupaddon append=true}
                                                {button type='submit' variant='secondary' class='min-w-sm'}
                                                    {lang key='newsletterSendSubscribe' section='newsletter'}
                                                {/button}
                                            {/inputgroupaddon}
                                        {/inputgroup}
                                    {/formgroup}
                                {/block}
                                {block name='layout-footer-form-captcha'}
                                    <div class="{if !empty($plausiArr.captcha) && $plausiArr.captcha === true} has-error{/if}">
                                        {captchaMarkup getBody=true}
                                    </div>
                                {/block}
                            {/form}
                        {/block}
                    {/col}
                {/row}
                <hr>
            {/block}
        </div>
    {/if}
    
    {getBoxesByPosition position='bottom' assign='footerBoxes'}
    {if isset($footerBoxes) && count($footerBoxes) > 0}
        <div class="bg-gray-light pt-3 pb-3 pt-md-6 pb-md-6 position-relative"> 
            <div class="container-fluid container-fluid-xl">
                {row id='footer-boxes' class="new-footer justify-content-end"}
                    {col cols=12 sm=6 md=6 lg=3}
                        <div class="productlist-filter-headline d-none d-md-flex">
                            Service
                        </div>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="https://wa.me/4924029791380/?text=Hallo,%20ich%20habe%20eine%20Frage,%20kann%20ich%20mit%20jemandem%20sprechen?" class="btn btn-primary">
                                    {include file='snippets/mb_icon.tpl' mbIcon='whatsapp' mbClass='text-white'} WhatsApp Support
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="mailto:support@megabar.de" class="btn btn-primary">
                                    <i class="fas fa-envelope text-white"></i> E-Mail Support
                                </a>
                            </li>
                        </ul>
                    {/col}
                    {col cols=12 sm=6 md=6 lg=3}
                        <div class="productlist-filter-headline d-none d-md-flex text-dark ">
                            {$Einstellungen.global.global_shopname}{if $Einstellungen.global.global_shopname|strstr:"Händlershop"}{else} Händlershop{/if} 
                        </div>
                        <picture>
                            <source srcset="{$ShopURL}/templates/Megabar/themes/smoke2u/gfx/megabar-logo-footer.webp" type="image/webp">
                            <img src="{$ShopURL}/templates/Megabar/themes/smoke2u/gfx/megabar-logo-footer.png" width="380" height="127" loading="lazy" decoding="async" alt="{$Einstellungen.global.global_shopname}" class="w-50 h-auto mb-2">
                        </picture>
                        <p><a href="https://b2b.smoke2u.de/?ref=s2uf" class="text-dark">Jetzt Händler werden</a></p> 
                    {/col}
                    {foreach $footerBoxes as $box}
                        {if $box->isActive() && !empty($box->getRenderedContent())}
                            {col cols=12 sm=6 md=3 lg=2 class="pr-lg-6 text-dark" id="fbox-{$box@iteration}"}
                                {$box->getRenderedContent()}
                            {/col}
                        {/if}
                    {/foreach}
                    {if $Einstellungen.template.footer.socialmedia_footer === 'Y'}
                 
                        {block name='layout-footer-socialmedia'}
                            {col cols=12 sm=6 md=3 lg=2 class="pr-lg-6"}
                                <div class="productlist-filter-headline d-none d-md-flex text-dark ">
                                    Folge uns
                                </div>
                                <ul class="list-unstyled d-flex flex-wrap socials text-dark ">
                                {if !empty($Einstellungen.template.footer.facebook)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.facebook, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.facebook}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-facebook btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Facebook'}"] title="Facebook" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='facebook-f' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.twitter)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.twitter, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.twitter}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-twitter btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Twitter'}"] title="Twitter" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='twitter' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.youtube)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.youtube, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.youtube}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-youtube btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='YouTube'}"] title="YouTube" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='youtube' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.vimeo)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.vimeo, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.vimeo}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-vimeo btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Vimeo'}"]  title="Vimeo" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='vimeo-v' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.pinterest)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.pinterest, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.pinterest}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-pinterest btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Pinterest'}"]  title="Pinterest" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='pinterest-p' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.instagram)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.instagram, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.instagram}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-instagram btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Instagram'}"]  title="Instagram" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='instagram' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.tiktok)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.tiktok, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.tiktok}"
                                        class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-instagram btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='TikTok'}"]  title="TikTok" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='tiktok' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.skype)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.skype, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.skype}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-skype btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Skype'}"]  title="Skype" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='skype' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.xing)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.xing, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.xing}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-xing btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Xing'}"]  title="Xing" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='xing' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                {if !empty($Einstellungen.template.footer.linkedin)}
                                    <li>
                                        {link href="{if strpos($Einstellungen.template.footer.linkedin, 'http') !== 0}https://{/if}{$Einstellungen.template.footer.linkedin}"
                                            class="square align-items-center align-content-center justify-content-center btn-icon-secondary btn-linkedin btn btn-sm" aria=['label'=>"{lang key='visit_us_on' section='aria' printf='Linkedin'}"]  title="Linkedin" target="_blank" rel="noopener"}
                                            {include file='snippets/mb_icon.tpl' mbIcon='linkedin-in' mbClass='fa-fw fa-lg'}
                                        {/link}
                                    </li>
                                {/if}
                                </ul>
                            {/col}
                        {/block}
                    {/if}
                {/row}
                {* Megabar: withdrawal button ("Widerrufsformular") from NOVA 5.8.2 footer.tpl; renders only if
                   Einstellungen > Kunden > widerruf_button_aktiv = Y and the withdrawal form page exists *}
                {block name='layout-footer-withdrawal'}
                    {row class="withdrawal-link-wrapper"}
                        {col cols=12 sm=6 md=4 lg=3}
                            {include file='snippets/withdrawal_link.tpl'}
                        {/col}
                    {/row}
                {/block}
            </div>
        </div>
    {/if}
    
    <div class="bg-dark text-white position-relative newfooterdark">
        <div class="container-fluid container-fluid-xl">
            {row}
                {col cols=12 md=12 class="d-flex flex-column flex-md-row footer-new-gap px-3 px-md-0 justify-content-between"}
                <div class="footnote-vat">
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
                        {block name='footer-vat-notice'}
                            <span class="small">* {$footnoteVat}{if isset($footnoteShipping)}{$footnoteShipping}{/if}</span>
                        {/block}
                    </div>
                    {block name='layout-footer-copyright'}
                        <div id="copyright" class="m-0 p-0">
                           
                                {row class="m-0 p-0"}
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
                                                Powered by {link href="https://jtl-url.de/jtlshop" class="text-white text-decoration-underline" title="JTL-Shop" target="_blank" rel="noopener"}JTL-Shop{/link}
                                            {/col}
                                        {/block}
                                    {/if}
                                {/row}
                        
                        </div>
                    {/block}
                {/col}
                
            {/row}
        </div>
    </div>
   
{/block}

