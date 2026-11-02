{block name='productdetails-details'}
    {*{has_boxes position='left' assign='hasLeftBox'}*}
    {$hasLeftBox = false}
    {if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
        <div class="d-block w-100">
            {if isset($bWarenkorbHinzugefuegt) && $bWarenkorbHinzugefuegt}
                {block name='productdetails-details-include-pushed-success'}
                    {include file='productdetails/pushed_success.tpl' card=true}
                {/block}
            {else}
                {block name='productdetails-details-alert-product-note'}
                    {$alertList->displayAlertByKey('productNote')}
                {/block}
            {/if}
        </div>
    {else}
        {container class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {if isset($bWarenkorbHinzugefuegt) && $bWarenkorbHinzugefuegt}
                {block name='productdetails-details-include-pushed-success'}
                    {include file='productdetails/pushed_success.tpl' card=true}
                {/block}
            {else}
                {block name='productdetails-details-alert-product-note'}
                    {$alertList->displayAlertByKey('productNote')}
                {/block}
            {/if}
        {/container}
    {/if}
    
    {block name='productdetails-details-form'}
        {opcMountPoint id='opc_before_buy_form' inContainer=false}
        {container class="details-container upper{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {if $isMobile && !$isTablet}
                {row id="headline-row"}
                    {col cols=12 class="text-center"}
                        <div class="product-headline" data-ajax-settings="{if isset($bAjaxRequest) && $bAjaxRequest}true{else}false{/if}">
                            {block name='productdetails-details-info-product-title'}
                                {opcMountPoint id='opc_before_headline'}
                                <h1 class="mb-0 pb-0 product-title h2 font-weight-bold" itemprop="name">{$Artikel->cName}</h1>
                                
                            {/block}
                            
                        </div>
                    {/col}
                {/row}
            {/if}

            {row id="buy-form-row" class="{if !$isMobile}pt-3 mt-3{/if} justify-content-center"}

            {col cols=12 md=7 lg=8}
                {form id="buy_form{if !empty($smarty.get.quickView)}-quickview{/if}" action=$Artikel->cURLFull class="jtl-validate"}
                    {row id="product-offer" class="product-detail pb-3 mb-3"}

                        {block name='productdetails-details-include-image'}
                            {col cols=12 lg=6 class="product-gallery"}
                                {opcMountPoint id='opc_before_gallery'}
                                    {include file='productdetails/image.tpl'}
                                {opcMountPoint id='opc_after_gallery'}
                            {/col}
                        {/block}

                        {col cols=12 lg=6 class="product-info"}
                            {block name='productdetails-details-info'}
                            <div class="product-info-inner {if !$isMobile}pr-2{/if}" data-erscheinungs-datum="{$Artikel->Erscheinungsdatum_de}" data-datum="{$Artikel->nErscheinendesProdukt}">

                                {if ($Artikel->Bewertungen->oBewertungGesamt->nAnzahl > 0) || isset($Artikel->cArtNr)}
                                    {if ($Einstellungen.bewertung.bewertung_anzeigen === 'Y' && $Artikel->Bewertungen->oBewertungGesamt->nAnzahl > 0)}
                                        {block name='productdetails-details-info-rating-wrapper'}
                                            <div class="rating-wrapper" itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">
                                                <meta itemprop="ratingValue" content="{$Artikel->Bewertungen->oBewertungGesamt->fDurchschnitt}"/>
                                                <meta itemprop="bestRating" content="5"/>
                                                <meta itemprop="worstRating" content="1"/>
                                                <meta itemprop="reviewCount" content="{$Artikel->Bewertungen->oBewertungGesamt->nAnzahl}"/>
                                                {block name='productdetails-details-include-rating'}
                                                    {if empty($smarty.get.quickView)}
                                                    {link href="{$Artikel->cURLFull}#tab-votes"
                                                        id="jump-to-votes-tab"
                                                        aria=["label"=>{lang key='Votes'}]
                                                    }
                                                        {include file='productdetails/rating.tpl' stars=$Artikel->Bewertungen->oBewertungGesamt->fDurchschnitt total=$Artikel->Bewertungen->oBewertungGesamt->nAnzahl}

                                                    {/link}
                                                    {else}
                                                        {include file='productdetails/rating.tpl' stars=$Artikel->Bewertungen->oBewertungGesamt->fDurchschnitt total=$Artikel->Bewertungen->oBewertungGesamt->nAnzahl}
                                                       
                                                    {/if}
                                                {/block}
                                            </div>
                                        {/block}
                                    {/if}
                                    {block name='productdetails-details-info-essential'}
                                        {* moved to tabs *}
                                    {/block}
                                {/if}

                                <div class="product-offer"{if !($Artikel->Preise->fVKNetto == 0 && $Einstellungen.global.global_preis0 === 'N')} itemprop="offers" itemscope itemtype="https://schema.org/Offer"{/if}>
                                    {block name='productdetails-details-info-hidden'}
                                        {if !($Artikel->Preise->fVKNetto == 0 && $Einstellungen.global.global_preis0 === 'N')}
                                            <meta itemprop="url" content="{$Artikel->cURLFull}">
                                            <link itemprop="businessFunction" href="http://purl.org/goodrelations/v1#Sell" />
                                        {/if}
                                        {input type="hidden" name="inWarenkorb" value="1"}
                                        {if $Artikel->kArtikelVariKombi > 0}
                                            {input type="hidden" name="aK" value=$Artikel->kArtikelVariKombi}
                                        {/if}
                                        {if isset($Artikel->kVariKindArtikel)}
                                            {input type="hidden" name="VariKindArtikel" value=$Artikel->kVariKindArtikel}
                                        {/if}
                                        {if isset($smarty.get.ek)}
                                            {input type="hidden" name="ek" value=intval($smarty.get.ek)}
                                        {/if}
                                        {input type="hidden" name="AktuellerkArtikel" class="current_article" name="a" value=$Artikel->kArtikel}
                                        {input type="hidden" name="wke" value="1"}
                                        {input type="hidden" name="show" value="1"}
                                        {input type="hidden" name="kKundengruppe" value=JTL\Session\Frontend::getCustomerGroup()->getID()}
                                        {input type="hidden" name="kSprache" value=JTL\Shop::getLanguageID()}
                                    {/block}

                                    {block name='productdetails-details-info-description-wrapper-desktop'}
                                        {if !$isMobile}
                                            {if !$isMobile}
                                                {row id="headline-row"}
                                                    {col cols=12 class="text-left"}
                                                        <div class="product-headline desktophead {if !empty($Artikel->cHersteller)}d-flex{/if}">
                                                            {block name='productdetails-details-info-product-title'}
                                                                {opcMountPoint id='opc_before_headline'}
                                                                <h1 class="mb-0 pb-0 product-title h2 font-weight-bold" itemprop="name">{$Artikel->cName}</h1>
                                                            {/block}

                                                            {block name='productdetails-details-info-manufacturer-wrapper'}
                                                                {if !empty($Artikel->cHersteller)}
                                                                    {block name='productdetails-details-product-info-manufacturer'}
                                                                        <div class="col-auto manufacturer-image ml-auto" itemprop="brand" itemscope itemtype="https://schema.org/Brand">
                                                                            {if $Einstellungen.artikeldetails.artikel_weitere_artikel_hersteller_anzeigen === 'Y'}
                                                                                <a href="{$Artikel->cHerstellerURL|replace:"smoke2u.de":"smoke2u.de/top-marken"|replace:"_1":""|replace:"_2":""}"
                                                                                    {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'B'}
                                                                                        data-toggle="tooltip"
                                                                                        data-placement="left"
                                                                                        title="{$Artikel->cHersteller}" 
                                                                                    {/if}
                                                                                itemprop="url">
                                                                            {/if}
                                                                                {if ($Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'B'
                                                                                    || $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'BT')
                                                                                    && !empty($Artikel->cHerstellerBildURLKlein)}
                                                                                    {image lazy=true
                                                                                        webp=true
                                                                                        src=$Artikel->cHerstellerBildURLKlein
                                                                                        alt=$Artikel->cHersteller|escape:'html'
                                                                                    }
                                                                                    <meta itemprop="image" content="{$Artikel->cHerstellerBildURLKlein}">
                                                                                {/if}
                                                                                {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen !== 'B'}
                                                                                    <span itemprop="name">{$Artikel->cHersteller}</span>
                                                                                {/if}
                                                                            {if $Einstellungen.artikeldetails.artikel_weitere_artikel_hersteller_anzeigen === 'Y'}
                                                                                </a>
                                                                            {/if}
                                                                        </div>
                                                                    {/block}
                                                                {/if}
                                                            {/block}  
                                                           
                                                        </div>
                                                    
                                                       
                                                    {/col}
                                                {/row}
                                            {/if}
                                            {if $Einstellungen.artikeldetails.artikeldetails_kurzbeschreibung_anzeigen === 'Y'}
                                                {block name='productdetails-details-info-description-desktop'}
                                                    {opcMountPoint id='opc_before_short_desc'}
                                                    {include file='productdetails/service_area.tpl'}
                                                {/block}
                                            {/if}
                                        {/if} 
                                    {/block}


                                    {block name='productdetails-details-include-variation'}
                                        <!-- VARIATIONEN -->
                                        {include file='productdetails/variation.tpl' simple=$Artikel->isSimpleVariation showMatrix=$showMatrix}
                                    {/block}

                                    {row class="mb-0"}
                                        {block name='productdetails-details-include-price'}
                                            <div class="col col-{if !($Artikel->Preise->fVKNetto == 0 && isset($Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_VOUCHER_FLEX]))}7{else}12{/if}">
                                            {if !($Artikel->Preise->fVKNetto == 0 && isset($Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_VOUCHER_FLEX]))}
                                                    {include file='productdetails/price.tpl' Artikel=$Artikel tplscope='detail' priceLarge=true}
                                            {/if}
                                            </div>
                                        {/block}
                                        {block name='productdetails-details-stock'}
                                            <div class="col col-{if !($Artikel->Preise->fVKNetto == 0 && isset($Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_VOUCHER_FLEX]))}5{else}12{/if}">
                                                {block name='productdetails-details-include-stock'}
                                                    <div class="pt-2">
                                                        {include file='productdetails/stock.tpl'}
                                                    </div>
                                                {/block}
                                                
                                                {if !($Artikel->nIstVater && $Artikel->kVaterArtikel == 0)}
                                                    {block name='productdetails-image-actions'}
                                                        <div class="product-actions-wrap d-flex justify-content-end pt-3" data-toggle="product-actions">
                                                            {if $Artikel->nErscheinendesProdukt || $Artikel->fLagerbestand == 0}
                                                          {*  <a href="{if $isMobile}#tabAccordion{else}#payment-at-details{/if}" class="btn question border-radius-0 badge badge-circle-1 action-tip-animation-b align-content-center btn-secondary">
                                                                <span class="fa fa-bell"></span>
                                                            </a>*}
                                                            {else}
                                                                {if $Einstellungen.artikeldetails.artikeldetails_vergleichsliste_anzeigen === 'Y'
                                                                    && $Einstellungen.vergleichsliste.vergleichsliste_anzeigen === 'Y'
                                                                    && empty($smarty.get.quickView)}
                                                                    {block name='productdetails-image-include-comparelist-button'}
                                                                        {include file='snippets/comparelist_button.tpl'}
                                                                    {/block}
                                                                {/if}
                                                                {if $Einstellungen.global.global_wunschliste_anzeigen === 'Y'
                                                                    && empty($smarty.get.quickView)}
                                                                    {block name='productdetails-image-include-wishlist-button'}
                                                                        {include file='snippets/wishlist_button.tpl'}
                                                                    {/block}
                                                                {/if}
                                                                
                                                                    
                                                                
                                                                {block name='productdetails-details-question-on-item'}
                                                                    {if $Einstellungen.artikeldetails.artikeldetails_fragezumprodukt_anzeigen === 'P'
                                                                        && empty($smarty.get.quickView)
                                                                    }
                                                                        <button type="button" id="z{$Artikel->kArtikel}"
                                                                                class="btn question badge badge-circle-1 action-tip-animation-b btn-secondary"
                                                                                title="{lang key='productQuestion' section='productDetails'}"
                                                                                data-toggle="modal"
                                                                                data-target="#question-popup-{$Artikel->kArtikel}">
                                                                            <span class="fa fa-question-circle"></span>
                                                                        </button>
                                                                    {/if}
                                                                {/block}
                                                            {/if}
                                                        </div>
                                                    {/block}
                                                {/if}
                                            
                                      
                                            </div>
                                        {/block}
                                    {/row}
                                    {row class="mb-0"}
                                        {block name='productdetails-details-stock-additional'}
                                            {col cols=12}
                                                {block name='snippets-stock-note-include-warehouse'}
                                                    {if empty($smarty.get.quickView)}
                                                    {include file='productdetails/warehouse.tpl'}
                                                    {/if}
                                                {/block}
                                            {/col}
                                        {/block}
                                    {/row}
                                    {*UPLOADS product-specific files, e.g. for customization*}
                                    {block name='productdetails-details-include-uploads'}
                                        {if empty($smarty.get.quickView)}
                                        {include file="snippets/uploads.tpl" tplscope='product'}
                                        {/if}
                                    {/block}
                                    {*WARENKORB anzeigen wenn keine variationen mehr auf lager sind?!*}
                                    {row id="basket-row" class="mb-0"}
                                        <div class="col-12">
                                            {if $Artikel->bHasKonfig}
                                                {block name='productdetails-details-config-button'}
                                                    {row}
                                                        {if isset($Artikel->Variationen) && $Artikel->Variationen|count > 0}
                                                            {block name='productdetails-details-config-button-info'}
                                                                {col cols=12 class="js-choose-variations-wrapper"}
                                                                    {alert variation="info" class="choose-variations"}
                                                                        {lang key='chooseVariations' section='messages'}
                                                                    {/alert}
                                                                {/col}
                                                            {/block}
                                                        {/if}
                                                        {block name='productdetails-details-config-button-button'}
                                                            {col cols=12 sm=6}
                                                                {if $Einstellungen.template.productdetails.config_position === 'popup'}
                                                                    {button type="button"
                                                                        class="start-configuration js-start-configuration"
                                                                        value="{lang key='configure'}"
                                                                        block=true
                                                                        data=["toggle"=>"modal", "target"=>"#cfg-container"]
                                                                        disabled=(isset($Artikel->Variationen) && $Artikel->Variationen|count > 0)
                                                                    }
                                                                        <span>{lang key='configure'}</span> <i class="fas fa-cogs"></i>
                                                                    {/button}
                                                                {else}
                                                                    {link type="button"
                                                                        class="btn btn-secondary start-configuration js-start-configuration"
                                                                        value="{lang key='configure'}"
                                                                        block=true
                                                                        href="#cfg-container"
                                                                        disabled=(isset($Artikel->Variationen) && $Artikel->Variationen|count > 0)
                                                                    }
                                                                        <span>{lang key='configure'}</span> <i class="fas fa-cogs"></i>
                                                                    {/link}
                                                                {/if}
                                                            {/col}
                                                        {/block}
                                                    {/row}
                                                {/block}
                                                {block name='productdetails-details-include-config-container-popup'}
                                                    {if $Einstellungen.template.productdetails.config_position === 'popup'}
                                                        {row id="product-configurator" class="cfg-position-{$Einstellungen.template.productdetails.config_position} cfg-layout-{$Einstellungen.template.productdetails.config_layout}"}
                                                            {include file='productdetails/config_container.tpl'}
                                                        {/row}
                                                    {/if}
                                                {/block}
                                            {else}
                                                {block name='productdetails-details-include-basket'}
                                                    {if empty($smarty.get.quickView)}
                                                        {include file='productdetails/basket.tpl'}
                                                    {/if}
                                                {/block}
                                            {/if}
                                        </div>

                                    {if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
                                        {*gebinde*}
                                        <div class="col-12 ean">
                                            {if isset($Artikel->dMHD) && isset($Artikel->dMHD_de)}
                                                <div class="product-mhd">
                                                    <strong title="{lang key='productMHDTool'}">
                                                        {lang key='productMHD'}:
                                                    </strong>
                                                    <span itemprop="best-before">{$Artikel->dMHD_de}</span>
                                                </div>
                                                {if isset($Artikel->dMHD) && isset($Artikel->dMHD_de) && empty($Artikel->cBarcode)}
                                                <hr class="mb-0">
                                                {/if}
                                            {/if}
                                            {block name='productdetails-details-info-gtin-add'}
                                                {if !empty($Artikel->cBarcode)
                                                && ($Einstellungen.artikeldetails.gtin_display === 'details'
                                                || $Einstellungen.artikeldetails.gtin_display === 'always')}
                                         
                                                    <strong>EAN:</strong>
                                                    <span itemprop="{if $Artikel->cBarcode|strlen === 8}gtin8{else}gtin13{/if}">{$Artikel->cBarcode}</span>
                                          
                                                <hr>
                                                {/if}
                                            {/block}
                                        </div>
                                       
                                            {if $Artikel->AttributeAssoc["Gebinde"] != ""}
                                               
                                                {assign var="hasGebinde" value="Y"}
                                                <div id="gebinde" class="col-12">
                                                    <p class="h3"><strong>{lang key="verpackungseinheiten" section="custom"}</strong></p>
                                                    
                                                    {assign var="gebindeString" value=$Artikel->AttributeAssoc["Gebinde"]}
                                                    {assign var="gebindeArray" value=","|explode:$gebindeString}
                                                    
                                                    {if $Artikel->AttributeAssoc["Gebindeeinheit"] != ""}
                                                        {assign var="gebindeEinheitString" value=$Artikel->AttributeAssoc["Gebindeeinheit"]}
                                                        {assign var="gebindeEinheitArray" value=","|explode:$gebindeEinheitString}
                                                    {/if}
                                                    
                                                    {if $Artikel->AttributeAssoc["Gebinde-GTIN"] != ""}
                                                        {assign var="gebindeEANString" value=$Artikel->AttributeAssoc["Gebinde-GTIN"]}
                                                        {assign var="gebindeEANArray" value=","|explode:$gebindeEANString}
                                                    {/if}
                                                    
                                                    {foreach $gebindeArray as $gebindeElement}
                                                        <div class="gebinde-einheit" data-gebinde-pos="{$gebindeElement@iteration}">
                                                            {math equation='x - y' x=$gebindeElement@iteration y=1 assign='gebindeCounter'}
                                                            {if $gebindeEANArray != ""}
                                                                EAN {$gebindeEANArray[$gebindeCounter]} - 
                                                            {/if}
                                                            {$gebindeElement} 
                                                            {lang key="gebinde-stueck-pro" section="custom"}
                                                            {if $gebindeEinheitArray != ""}
                                                                {$gebindeEinheitArray[$gebindeCounter]}
                                                            {else}
                                                                {lang key="gebindeStueck" section="custom"}
                                                            {/if}
                                                        </div>
                                                    {/foreach}
                                                </div>
                                                <div class="col-12">
                                                    <hr>
                                                </div>
                                            {/if}
                                          
                                            {*end gebinde*}
                                            

                                            {* gewinnrechner *}
                                            {if $Artikel->fUVP > 0} {* Sonst division by zero Error *}
                                            <div class="smoke-win-calc col-12">
                                                <p class="pt-3 text-winner h3"><strong>Gewinnrechner <span class="fas fa-chevron-down"></span></strong></p>
                                                <ul id="smoke2u-marge" class="mr-0 ml-0 pr-0 pl-0">
                                                    <li class="row">
                                                        <div class="col-6">UVP-Preis (brutto):</div><div class="col-6 text-right">
                                                            {$Artikel->getUVPLocalized(0)}
                                                        </div>
                                                    </li>
                                                    <li class="row">
                                                        <div class="col-6">UVP-Preis (netto):</div><div class="col-6 text-right">
                                                            {$Artikel->getUVPLocalized(1)}
                                                        </div>
                                                    </li>
                                                    <li class="row">
                                                        <div class="col-6">EK-Preis (netto):</div><div class="col-6 text-right">
                                                            -{$Artikel->Preise->cVKLocalized[$NettoPreise]}
                                                        </div>
                                                    </li>
                                                    <li class="row text-success"> {* uvp netto - ek netto *}
                                                        
                                                        {math equation="x - y" x=$Artikel->fUVP y=$Artikel->Preise->fVKNetto format="%.2f" assign="fWinningUVP"}
                                                        <div class="col-6 text-winner"><strong>Gewinn (netto):</strong></div><div class="col-6 text-right text-winner">
                                                        <strong>{$fWinningUVP|replace:".":","} €</strong>
                                                        </div>
                                                    </li>
                                                    <li class="row text-success">
                                                        {*fWinningUVP / $Artikel->fUVP * 100*}
                                                            {math equation="(a / b) * c" a=$fWinningUVP b=$Artikel->fUVP c=100 format="%.2f" assign="fWinningPerc"}
                                                            <div class="col-6 text-winner"><strong>Gewinnmarge (netto):</strong></div><div class="col-6 text-right text-winner">
                                                                <strong>{$fWinningPerc|replace:".":","}%</strong>
                                                            </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            {/if}
                                            {* gewinnrechner ende *}

                                        {* question on item / wishlist *}
                                        
                                    {/if}

                                    {/row}
                                    {block name='productdetails-details-info-description-wrapper'}
                                        {if $isMobile}
                                            {if $Einstellungen.artikeldetails.artikeldetails_kurzbeschreibung_anzeigen === 'Y'}
                                                {block name='productdetails-details-info-description'}
                                                    {opcMountPoint id='opc_before_short_desc'}
                                                    
                                                    {include file='productdetails/service_area.tpl'}
                                                {/block}
                                            {/if}
                                        {/if}
                                        {opcMountPoint id='opc_after_short_desc'}
                                    {/block}

                                    {block name='productdetails-details-info-essential-wrapper'}
                                        
                                    {/block}
                                </div>
                            </div> {*product-info-inner*}
                            {/block}{* productdetails-info *}
                            {opcMountPoint id='opc_after_product_info'}
                        {/col}
                        {block name='productdetails-details-include-config-container-details'}
                            {if $Artikel->bHasKonfig && $Einstellungen.template.productdetails.config_position === 'details'}
                                {col cols=12 id="product-configurator" class="cfg-position-{$Einstellungen.template.productdetails.config_position} cfg-layout-{$Einstellungen.template.productdetails.config_layout}"}
                                    {include file='productdetails/config_container.tpl'}
                                {/col}
                            {/if}
                        {/block}
                    {/row}
                    {block name='productdetails-details-include-matrix'}
                        {include file='productdetails/matrix.tpl'}
                    {/block}
                    {/form}
                {/col}

                {* check if upselling is enabled*}
                {if isset($Xselling->Standard) || isset($Xselling->Kauf) || isset($oAehnlicheArtikel_arr)}
                    {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
                            {foreach $Xselling->Standard->XSellGruppen as $Gruppe}

                                {* check if functial attribute for upselling is set and use it *}
                                {if isset($Artikel->FunktionsAttribute["upselling überschrift de"]) && !empty($Artikel->FunktionsAttribute["upselling überschrift de"])}
                                    {assign var="hasUpperXSeller" value="Y"}
                                {/if}
                            {/foreach}
                    {/if}
                {/if}

                {if $hasUpperXSeller === "Y"}
                    {col cols=12 md=5 lg=4 class="upsell-col"}
                        {* upseller *}
                        
                        {if isset($Xselling->Standard) || isset($Xselling->Kauf) || isset($oAehnlicheArtikel_arr)}
                            {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
                                <div class="recommendations upper d-print-none">
                                    {foreach $Xselling->Standard->XSellGruppen as $Gruppe}

                                        {* check if functial attribute for upselling is set and use it *}
                                        {if isset($Artikel->FunktionsAttribute["upselling überschrift de"]) && !empty($Artikel->FunktionsAttribute["upselling überschrift de"])}
                                            {assign var="xsellTitle" value="{$Artikel->FunktionsAttribute["upselling überschrift de"]}"}
                                        {else}
                                            {assign var="xsellTitle" value="{$Gruppe->Name}"}
                                        {/if}

                                        {if !$isMobile}
                                            {include file='snippets/product_slider.tpl' class='x-supplies' id='slider-xsell-group-'|cat:$Gruppe@iteration tplscope="xselltop" productlist=$Gruppe->Artikel title=$xsellTitle}
                                        {else}
                                            {include file='snippets/product_slider.tpl' class='x-supplies' id='slider-xsell-group-'|cat:$Gruppe@iteration tplscope="xselltop" productlist=$Gruppe->Artikel title=$xsellTitle}
                                        {/if}
                                    {/foreach}
                                </div>
                            {/if}
                        {/if}
                    {/col}
                {/if}

            {/row} {* buy form row *}
        {/container}
    {/block}

    {block name='productdetails-details-content-not-quickview'}
        {block name='productdetails-details-include-tabs'}
            {include file='productdetails/tabs.tpl'}
        {/block}

        {if empty($smarty.get.quickView)}
            {*SLIDERS*}
            {if isset($Einstellungen.artikeldetails.artikeldetails_stueckliste_anzeigen) && $Einstellungen.artikeldetails.artikeldetails_stueckliste_anzeigen === 'Y' && isset($Artikel->oStueckliste_arr) && $Artikel->oStueckliste_arr|count > 0
            || isset($Einstellungen.artikeldetails.artikeldetails_produktbundle_nutzen) && $Einstellungen.artikeldetails.artikeldetails_produktbundle_nutzen === 'Y' && isset($Artikel->oProduktBundle_arr) && $Artikel->oProduktBundle_arr|count > 0
            || isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0
            || isset($Xselling->Kauf->Artikel) && count($Xselling->Kauf->Artikel) > 0
            || isset($oAehnlicheArtikel_arr) && count($oAehnlicheArtikel_arr) > 0}
                {container fluid=true class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
                    {if isset($Einstellungen.artikeldetails.artikeldetails_stueckliste_anzeigen) && $Einstellungen.artikeldetails.artikeldetails_stueckliste_anzeigen === 'Y' && isset($Artikel->oStueckliste_arr) && $Artikel->oStueckliste_arr|count > 0}
                        {block name='productdetails-details-include-product-slider-partslist'}
                            <div class="partslist">
                                {lang key='listOfItems' section='global' assign='slidertitle'}
                                {include file='snippets/product_slider.tpl' id='slider-partslist' productlist=$Artikel->oStueckliste_arr title=$slidertitle showPartsList=true}
                            </div>
                        {/block}
                    {/if}

                    {if isset($Einstellungen.artikeldetails.artikeldetails_produktbundle_nutzen) && $Einstellungen.artikeldetails.artikeldetails_produktbundle_nutzen === 'Y' && isset($Artikel->oProduktBundle_arr) && $Artikel->oProduktBundle_arr|count > 0}
                        {block name='productdetails-details-include-bundle'}
                            <div class="bundle">
                                {include file='productdetails/bundle.tpl' ProductKey=$Artikel->kArtikel Products=$Artikel->oProduktBundle_arr ProduktBundle=$Artikel->oProduktBundlePrice ProductMain=$Artikel->oProduktBundleMain}
                            </div>
                        {/block}
                    {/if}
                    {if isset($Xselling->Standard) || isset($Xselling->Kauf) || isset($oAehnlicheArtikel_arr)}
                        <div class="recommendations d-print-none">
                            {block name='productdetails-details-recommendations'}

                                {if isset($Xselling->Kauf->Artikel) && count($Xselling->Kauf->Artikel) > 0}
                                    {lang key='customerWhoBoughtXBoughtAlsoY' section='productDetails' assign='slidertitle'}
                                    {include file='snippets/product_slider.tpl' class='x-sell' id='slider-xsell' productlist=$Xselling->Kauf->Artikel title=$slidertitle}
                                {/if}

                                {if isset($oAehnlicheArtikel_arr) && count($oAehnlicheArtikel_arr) > 0}
                                    {lang key='RelatedProducts' section='productDetails' assign='slidertitle'}
                                    {include file='snippets/product_slider.tpl' class='x-related' id='slider-related' productlist=$oAehnlicheArtikel_arr title=$slidertitle}
                                {/if}
                            {/block}
                        </div>
                    {/if}
                {/container}
            {/if}
            {block name='productdetails-details-include-popups'}
                <div id="article_popups">
                    {include file='productdetails/popups.tpl'}
                </div>
            {/block}
        {/if}
    {/block}
{/block}
