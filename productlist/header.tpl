
{if JTL\Session\Frontend::getCustomer()->getID() === 0 &&  $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
    {block name='productlist-index'} 
        {*not logged in *}
        {include file='layout/header.tpl' hLogin="ja"}
        {include file='snippets/b2b_login.tpl'}
    {/block}
    
    {block name='productlist-index-content'}
    {/block}
    
    {block name='productlist-index-include-footer'}
    {/block}
{else}
 
    {block name='productlist-header'}
        {if !isset($oNavigationsinfo)
            || (!$oNavigationsinfo->getManufacturer() && !$oNavigationsinfo->getCharacteristicValue() && !$oNavigationsinfo->getCategory())}
            {opcMountPoint id='opc_before_heading'}
            {block name='productlist-header-heading'}
                <div class="h1">{$Suchergebnisse->getSearchTermWrite()}</div>
            {/block}
        {/if}

        {if $Suchergebnisse->getSearchUnsuccessful() == true}
            {opcMountPoint id='opc_before_no_results'}
            {block name='productlist-header-alert'}
                {alert variant="info"}{lang key='noResults' section='productOverview'}{/alert}
            {/block}
            {block name='productlist-header-form-search'}
                {form id="suche2" action=$ShopURL method="get" slide=true}
                    <fieldset>
                        {formgroup label-for="searchkey" label="{lang key='searchText'}"}
                                {input type="text" name="suchausdruck" value="{if $Suchergebnisse->getSearchTerm()}{$Suchergebnisse->getSearchTerm()|escape:'htmlall'}{/if}" id="searchkey"}
                        {/formgroup}
                        {button variant="primary" type="submit" value="1"}{lang key='searchAgain' section='productOverview'}{/button}
                    </fieldset>
                {/form}
            {/block}
        {/if}

        {block name='productlist-header-include-extension'}
            {include file='snippets/extension.tpl'}
        {/block}

        {block name='productlist-header-description'}
                {$showTitle = true}
                {$showImage = true}
                {$navData = null}
                {if $oNavigationsinfo->getCategory() !== null}
                    {$showTitle = in_array($Einstellungen['navigationsfilter']['kategorie_bild_anzeigen'], ['Y', 'BT'])}
                    {$showImage = in_array($Einstellungen['navigationsfilter']['kategorie_bild_anzeigen'], ['B', 'BT'])}
                    {$navData = $oNavigationsinfo->getCategory()}
                    {if $Einstellungen.template.megamenu.mobile_start_category === 'Y'}
                        <input type="hidden" id="category-id" value="{$oNavigationsinfo->getCategory()->getID()}">
                    {/if}
                {elseif $oNavigationsinfo->getManufacturer() !== null}
                    {$showImage = in_array($Einstellungen['navigationsfilter']['hersteller_bild_anzeigen'], ['B', 'BT'])}
                    {$showTitle = in_array($Einstellungen['navigationsfilter']['hersteller_bild_anzeigen'], ['Y', 'BT'])}
                    {$navData = $oNavigationsinfo->getManufacturer()}
                {elseif $oNavigationsinfo->getCharacteristicValue() !== null}
                    {$showImage = in_array($Einstellungen['navigationsfilter']['merkmalwert_bild_anzeigen'], ['B', 'BT'])}
                    {$showTitle = in_array($Einstellungen['navigationsfilter']['merkmalwert_bild_anzeigen'], ['Y', 'BT'])}
                    {$navData = $oNavigationsinfo->getCharacteristicValue()}
                {/if}

                {if $oNavigationsinfo->getImageURL() !== $smarty.const.BILD_KEIN_KATEGORIEBILD_VORHANDEN
                    && $oNavigationsinfo->getImageURL() !== 'gfx/keinBild_kl.gif'
                    && $oNavigationsinfo->getImageURL() !== $imageBaseURL|cat:$smarty.const.BILD_KEIN_KATEGORIEBILD_VORHANDEN
                    && $showImage}
                        {include file='snippets/image.tpl'
                        class='productlist-header-description-image'
                        item=$navData
                        square=false
                        lazy=false
                        sizes="{if !$bExclusive && $boxes.left !== null && !empty(trim(strip_tags($boxes.left))) && (($Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive) || $smarty.const.PAGE_ARTIKELLISTE === $nSeitenTyp)}(min-width: 992px) 67vw, (min-width: 1300px) 75vw, 100vw{/if} "
                        alt="{if $oNavigationsinfo->getCategory() !== null && !empty($navData->getImageAlt())}{$navData->getImageAlt()}{else}{$navData->getDescription()|default:''|strip_tags|truncate:50}{/if}"}
                {/if}
                {if $oNavigationsinfo->getName() && $showTitle}
                        <div class="title text-center">
                            {opcMountPoint id='opc_before_heading'}
                            {block name='productlist-header-description-heading'}
                                <div>
                                   {assign var="hasFNheadline" value="N"}
                                    {* goe 21052024 - Abfrage eingebaut, da sonst Error auf Merkmalseiten *}
                                    {* goe 31072026 - Null-Check für getCategory() ergänzt, da sonst Error auf Hersteller-Seiten *}
                                    {assign var="oCategory" value=$oNavigationsinfo->getCategory()}
                                    {if !$oNavigationsinfo->getCharacteristicValue() && $oCategory && $oCategory->getCategoryFunctionAttributes()}
                                        {foreach from=$oCategory->getCategoryFunctionAttributes() key=fnKey item=fnItem}
                                            {if $fnKey == "h1-text"}
                                                {if !empty($fnItem)}
                                                    <h1 class="h1 catland pb-3 mb-3" data-h1-id="smokeCat-{$oCategory->slugs[1]}">{$fnItem}</h1>
                                                    {assign var="hasFNheadline" value="Y"}
                                                {/if}
                                            {/if}
                                        {/foreach}
                                    {/if}
                                    {if $hasFNheadline === "N"}
                                        <h1 class="h1 catland pb-3 mb-3" data-h1-id="smokeCat-{$oNavigationsinfo->getCategory()->slugs[1]}">
                                            <strong>{$oNavigationsinfo->getName()}</strong> {lang key="catHeaderAddition" section="custom"}
                                        </h1>
                                    {/if}
                                </div>
                            {/block}
                        </div>
                {/if}
        {/block}

        {if $Einstellungen.template.smokegeneralsettings.smokecat == "flame"}
            {block name='productlist-header-subcategories'}
            

                {container class="catland goe-scroll"}
                {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'N' && $oUnterKategorien_arr|@count > 0}
                    {opcMountPoint id='opc_before_subcategories'}
                    {if $isMobile}
                    {row}
                        {col cols=12 lg=10 offset-lg=1 class="subcatwrap"}

                            {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside row-eq-height content-cats-small mt-0"
                                data=[
                                    "slick-type" => "subcat-slider"
                                ]
                            }
                                {include file='snippets/subcat_slider_item.tpl' items=$oUnterKategorien_arr type='subcat-slider'}
                            {/row}

                        {/col}
                    {/row}
                    {else}
                        {row}
                            {col cols=12 lg=10 offset-lg=1 class="subcatwrap"}
                                {row class="row-eq-height content-cats-small mt-0 justify-content-center"}
                                {assign var="s2uCatIndex" value=0}
                                    {foreach $oUnterKategorien_arr as $subCategory}
                                        {$s2uCatIndex = $s2uCatIndex+1}
                                        {col cols=4 sm=4 md=4 lg=2 class="text-center justify-content-center categorie-flame d-grid catflame"}
                                            <div class="sub-categories">
                                                {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'Y'}
                                                    {block name='productlist-header-subcategories-image'}
                                                        {link href=$subCategory->getURL()}
                                                            {$imgAlt = $subCategory->getAttribute('img_alt')}
                                                            {$imgSrc = $subCategory->getImage(\JTL\Media\Image::SIZE_SM)}
                                                            <div class="subcategories-image d-md-flex mb-0">
                                                                {image fluid=true lazy=true webp=true
                                                                    src=$imgSrc
                                                                    width="{if strpos($imgSrc, 'keinBild.gif') !== false}
                                                                        130
                                                                    {else}
                                                                        130
                                                                    {/if}"|strip
                                                                    height="{if strpos($imgSrc, 'keinBild.gif') !== false}
                                                                        130
                                                                    {else}
                                                                        130
                                                                    {/if}"|strip
                                                                    alt="{if empty($imgAlt->cWert)}{$subCategory->getName()}{else}{$imgAlt->cWert}{/if}"
                                                                    srcset="
                                                                        {$subCategory->getImage(\JTL\Media\Image::SIZE_MD)}
                                                                        {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_MD)}w,
                                                                        {$subCategory->getImage(\JTL\Media\Image::SIZE_MD)}
                                                                        {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_MD)}w,
                                                                        {$subCategory->getImage(\JTL\Media\Image::SIZE_MD)}
                                                                        {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_MD)}w"|strip
                                                                    sizes="130px, 130px"
                                                                }
                                                            </div>
                                                        {/link}
                                                    {/block}
                                                {/if}
                                                <div>
                                                    {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'B'}
                                                        {block name='productlist-header-subcategories-link'}
                                                            <div class="caption pt-3">
                                                                {link href=$subCategory->getURL() class="h4 text-decoration-none"}
                                                                    {$subCategory->getName()}
                                                                {/link}
                                                            </div>
                                                        {/block}
                                                    {/if}
                                                    {if $Einstellungen.navigationsfilter.unterkategorien_beschreibung_anzeigen === 'Y'
                                                            && !empty($subCategory->getDescription())}
                                                        {block name='productlist-header-subcategories-description'}
                                                            <p class="item_desc small text-muted-util d-none d-md-block">
                                                                {$subCategory->getDescription()|strip_tags|truncate:68}
                                                            </p>
                                                        {/block}
                                                    {/if}
                                                    {if $Einstellungen.navigationsfilter.unterkategorien_lvl2_anzeigen === 'Y'}
                                                        {if $subCategory->hasChildren()}
                                                            {block name='productlist-header-subcategories-list'}
                                                                <hr class="d-none d-md-block">
                                                                <ul class="d-none d-md-block">
                                                                    {foreach $subCategory->getChildren() as $subChild}
                                                                        <li>
                                                                            {link href=$subChild->getURL() title=$subChild->getName()}{$subChild->getName()}{/link}
                                                                        </li>
                                                                    {/foreach}
                                                                </ul>
                                                            {/block}
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </div>
                                        {/col}
                                    {/foreach}
                                    {if $s2uCatIndex > 6}
                                        {$s2uCatIndex=$s2uCatIndex-5}
                                        {col cols=4 sm=4 md=4 lg=2 class="text-left justify-content-center d-grid catmore"}
                                            <div class="sub-categories">
                                                <div class="showmore"><strong><span class="text-primary">+ {$s2uCatIndex}</span></strong> weitere <strong>Kategorie{if $s2uCatIndex > 1}n{/if}</strong></div>
                                                <div class="showless">weniger <strong>Kategorien</strong> anzeigen</div>
                                            </div>
                                        {/col}
                                    {/if}
                                {/row}
                            {/col}
                        {/row}
                    {/if}
    
                {/if}
                {/container}
            {/block}
        {elseif $Einstellungen.template.smokegeneralsettings.smokecat == "btn"}
            {* button cat style *}
            {block name='productlist-header-subcategories'}
            
                {if $oNavigationsinfo->getName()|strstr:"Marken" && $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2C"}
                   
                
                {container class="catland goe-scroll"}
                {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'N' && $oUnterKategorien_arr|@count > 0}
                    {opcMountPoint id='opc_before_subcategories'}
                    {if $isMobile}
                    {row}
                        {col cols=12 lg=10 offset-lg=1 class="subcatwrap"}

                            {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside row-eq-height content-cats-small mt-0"
                                data=[
                                    "slick-type" => "subcat-slider"
                                ]
                            }
                                {include file='snippets/subcat_slider_item.tpl' items=$oUnterKategorien_arr type='subcat-slider'}
                            {/row}

                        {/col}
                    {/row}
                    {else}
                        {row}
                            {col cols=12 lg=10 offset-lg=1 class="subcatwrap"}
                                {row class="row-eq-height content-cats-small mt-0 justify-content-center"}
                                {assign var="s2uCatIndex" value=0}
                                    {foreach $oUnterKategorien_arr as $subCategory}
                                        {$s2uCatIndex = $s2uCatIndex+1}
                                        {col cols=4 sm=4 md=4 lg=2 class="text-center justify-content-center categorie-flame d-grid catflame"}
                                            <div class="sub-categories">
                                                {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'Y'}
                                                    {block name='productlist-header-subcategories-image'}
                                                        {link href=$subCategory->getURL()}
                                                            {$imgAlt = $subCategory->getAttribute('img_alt')}
                                                            {$imgSrc = $subCategory->getImage(\JTL\Media\Image::SIZE_SM)}
                                                            <div class="subcategories-image d-md-flex mb-0">
                                                                {image fluid=true lazy=true webp=true
                                                                    src=$imgSrc
                                                                    width="{if strpos($imgSrc, 'keinBild.gif') !== false}
                                                                        130
                                                                    {else}
                                                                        130
                                                                    {/if}"|strip
                                                                    height="{if strpos($imgSrc, 'keinBild.gif') !== false}
                                                                        130
                                                                    {else}
                                                                        130
                                                                    {/if}"|strip
                                                                    alt="{if empty($imgAlt->cWert)}{$subCategory->getName()}{else}{$imgAlt->cWert}{/if}"
                                                                    srcset="
                                                                        {$subCategory->getImage(\JTL\Media\Image::SIZE_MD)}
                                                                        {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_MD)}w,
                                                                        {$subCategory->getImage(\JTL\Media\Image::SIZE_MD)}
                                                                        {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_MD)}w,
                                                                        {$subCategory->getImage(\JTL\Media\Image::SIZE_MD)}
                                                                        {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_MD)}w"|strip
                                                                    sizes="130px, 130px"
                                                                }
                                                            </div>
                                                        {/link}
                                                    {/block}
                                                {/if}
                                                <div>
                                                    {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'B'}
                                                        {block name='productlist-header-subcategories-link'}
                                                            <div class="caption pt-3">
                                                                {link href=$subCategory->getURL() class="h4 text-decoration-none"}
                                                                    {$subCategory->getName()}
                                                                {/link}
                                                            </div>
                                                        {/block}
                                                    {/if}
                                                    {if $Einstellungen.navigationsfilter.unterkategorien_beschreibung_anzeigen === 'Y'
                                                            && !empty($subCategory->getDescription())}
                                                        {block name='productlist-header-subcategories-description'}
                                                            <p class="item_desc small text-muted-util d-none d-md-block">
                                                                {$subCategory->getDescription()|strip_tags|truncate:68}
                                                            </p>
                                                        {/block}
                                                    {/if}
                                                    {if $Einstellungen.navigationsfilter.unterkategorien_lvl2_anzeigen === 'Y'}
                                                        {if $subCategory->hasChildren()}
                                                            {block name='productlist-header-subcategories-list'}
                                                                <hr class="d-none d-md-block">
                                                                <ul class="d-none d-md-block">
                                                                    {foreach $subCategory->getChildren() as $subChild}
                                                                        <li>
                                                                            {link href=$subChild->getURL() title=$subChild->getName()}{$subChild->getName()}{/link}
                                                                        </li>
                                                                    {/foreach}
                                                                </ul>
                                                            {/block}
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </div>
                                        {/col}
                                    {/foreach}
                                    {if $s2uCatIndex > 6}
                                        {$s2uCatIndex=$s2uCatIndex-5}
                                        {col cols=4 sm=4 md=4 lg=2 class="text-left justify-content-center d-grid catmore"}
                                            <div class="sub-categories">
                                                <div class="showmore"><strong><span class="text-primary">+ {$s2uCatIndex}</span></strong> weitere <strong>Kategorie{if $s2uCatIndex > 1}n{/if}</strong></div>
                                                <div class="showless">weniger <strong>Kategorien</strong> anzeigen</div>
                                            </div>
                                        {/col}
                                    {/if}
                                {/row}
                            {/col}
                        {/row}
                    {/if}
    
                {/if}
                {/container}
                {else}
                    {row class="mb-6 justify-content-center"}
                        {foreach $oUnterKategorien_arr as $subCategory}
                            {if $subCategory->getName()|strlen > 20}
                                {assign var="stringWidth" value=12}
                            {else}
                                {assign var="stringWidth" value=6}
                            {/if}
                            {col cols=$stringWidth sm=4 md=3 lg=2}
                                
                                    {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'Y'} 
                                        {block name='productlist-header-subcategories-image'}
                                            
                                        {/block}
                                    {/if}
                                    <div class="h-100">
                                        {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'B'}
                                            {block name='productlist-header-subcategories-link'}
                                                <div class="caption pt-3 w-100 h-100 {if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}square{/if}">
                                                    {link href=$subCategory->getURL() class="btn btn-primary w-100 h-100 align-content-center {if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}rounded-circle h3{/if}"}
                                                        {$subCategory->getName()}
                                                    {/link}
                                                </div>
                                            {/block}
                                        {/if}
                                        {if $Einstellungen.navigationsfilter.unterkategorien_beschreibung_anzeigen === 'Y'
                                                && !empty($subCategory->getDescription())}
                                            {block name='productlist-header-subcategories-description'}
                                              
                                            {/block}
                                        {/if}
                                        {if $Einstellungen.navigationsfilter.unterkategorien_lvl2_anzeigen === 'Y'}
                                            {if $subCategory->hasChildren()}
                                                {block name='productlist-header-subcategories-list'}
                                                   
                                                {/block}
                                            {/if}
                                        {/if}
                                    </div>
                              
                            {/col}
                        {/foreach}
                    {/row}
                {/if}
            {/block}
            {* button cat style end *}
        {else}
            {* default fallback *}
            {block name='productlist-header-subcategories'}
                 {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'N' && $oUnterKategorien_arr|count > 0}
                    {opcMountPoint id='opc_before_subcategories'}
                    {row class="row-eq-height content-cats-small"}
                        {foreach $oUnterKategorien_arr as $subCategory}
                            {col cols=6 md=4 lg=3}
                                <div class="sub-categories">
                                    {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'Y'}
                                        {block name='productlist-header-subcategories-image'}
                                            {link href=$subCategory->getURL()}
                                                {$imgAlt = $subCategory->getAttribute('img_alt')}
                                                {$imgSrc = $subCategory->getImage(\JTL\Media\Image::SIZE_SM)}
                                                <div class="subcategory-image square justify-content-center align-items-center d-md-flex">
                                                    {image fluid=true lazy=true webp=true
                                                        src=$imgSrc
                                                        width="{if strpos($imgSrc, 'keinBild.gif') !== false}
                                                            130
                                                        {else}
                                                            {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_MD)}
                                                        {/if}"|strip
                                                        height="{if strpos($imgSrc, 'keinBild.gif') !== false}
                                                            130
                                                        {else}
                                                            {$subCategory->getImageHeight(\JTL\Media\Image::SIZE_MD)}
                                                        {/if}"|strip
                                                        alt="{if empty($imgAlt->cWert)}{$subCategory->getName()}{else}{$imgAlt->cWert}{/if}"
                                                        srcset="
                                                            {$subCategory->getImage(\JTL\Media\Image::SIZE_XS)}
                                                            {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_XS)}w,
                                                            {$subCategory->getImage(\JTL\Media\Image::SIZE_SM)}
                                                            {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_SM)}w,
                                                            {$subCategory->getImage(\JTL\Media\Image::SIZE_MD)}
                                                            {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_MD)}w"|strip
                                                        sizes="(min-width: 992px) 25vw, 33vw"
                                                    }
                                                </div>
                                            {/link}
                                        {/block}
                                    {/if}
                                    <div>
                                        {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'B'}
                                            {block name='productlist-header-subcategories-link'}
                                                <div class="caption">
                                                    {link href=$subCategory->getURL() class="h3 text-dark"}
                                                        {$subCategory->getName()}
                                                    {/link}
                                                </div>
                                            {/block}
                                        {/if}
                                        {if $Einstellungen.navigationsfilter.unterkategorien_beschreibung_anzeigen === 'Y'
                                                && !empty($subCategory->getDescription())}
                                            {block name='productlist-header-subcategories-description'}
                                                <p class="item_desc small text-muted-util d-none d-md-block">
                                                    {$subCategory->getDescription()|strip_tags|truncate:68}
                                                </p>
                                            {/block}
                                        {/if}
                                        {if $Einstellungen.navigationsfilter.unterkategorien_lvl2_anzeigen === 'Y'}
                                            {if $subCategory->hasChildren()}
                                                {block name='productlist-header-subcategories-list'}
                                                    <hr class="d-none d-md-block">
                                                    <ul class="d-none d-md-block">
                                                        {foreach $subCategory->getChildren() as $subChild}
                                                            <li>
                                                                {link href=$subChild->getURL() title=$subChild->getName()}{$subChild->getName()}{/link}
                                                            </li>
                                                        {/foreach}
                                                    </ul>
                                                {/block}
                                            {/if}
                                        {/if}
                                    </div>
                                </div>
                            {/col}
                        {/foreach}
                    {/row}
                {/if}
            {/block}
        {/if}

        {block name='productlist-header-include-selection-wizard'}
            {include file='selectionwizard/index.tpl' container=false}
        {/block}

        <div id="dropper-cat-hook-before-filter"></div>
        
            {if $Suchergebnisse->getProductCount() === 0 && $NaviFilter->getFilterCount() === 0}
           
            {else}
                <div class="filter-cat {if $NaviFilter->getFilterCount() > 0 && $Suchergebnisse->getProductCount() === 0} noFilterResults{/if}" data-serach-count="{$Suchergebnisse->getProductCount()}" data-filter-count="{$Suchergebnisse->getProductCount()}">
                    <div class="container-fluid container-fluid-xl">
                        {row}
                            {block name='productlist-header-include-productlist-page-nav'}
                        
                                    <div class="col col-6 {if $boxesLeftActive}order-2 {else}col-md-4 col-lg-2{/if}">
                                        <div class="product-filter-counts {if $NaviFilter->getFilterCount() > 0 && $Suchergebnisse->getProductCount() === 0}text-center{/if}">
                                            {block name='snippets-productlist-page-nav-current-page-count'}
                                                {if $NaviFilter->getFilterCount() > 0 && $Suchergebnisse->getProductCount() === 0}{lang key="noFilterPre" section="custom"} {/if}
                                                <strong>{$Suchergebnisse->getProductCount()} {lang key="nameProducts" section="custom"}</strong>
                                            {/block}
                                        </div>
                                    </div>
                                    {include file='snippets/productlist_page_nav.tpl' navid='header'}
                            {/block}
                        {/row}
                    </div>
                </div>
            {/if}
    
    
            {block name='productlist-header-include-active-filter'}
                {*if $NaviFilter->getFilterCount() > 0}
                    {container}
                        <div class="pb-3 pt-3">{$alertList->displayAlertByKey('noFilterResults')}</div>
                    {/container}
                {/if*}
            {/block}

    {/block}
{/if}