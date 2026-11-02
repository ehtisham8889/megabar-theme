{foreach $oUnterKategorien_arr as $subCategory}
    <div class="">
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
                        <div class="caption">
                            {link href=$subCategory->getURL()}
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
    </div>
{/foreach}