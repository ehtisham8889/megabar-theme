{if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2C" && !$isMobile}
    {block name='snippets-categories-mega-recursive-main-link'}
        <div data-href="{$mainCategory->getURL()}"
            class="smokelink cursor-pointer categories-recursive-link d-lg-block {if $firstChild}submenu-headline submenu-headline-toplevel{/if} {$subCategory} {if $mainCategory->hasChildren() && $subCategory < $max_subsub_items && $Einstellungen.template.megamenu.show_subcategories !== 'N'}nav-link dropdown-toggle{/if}"
            aria-expanded="false"
            data-category-id="{$mainCategory->getID()}"
            {if $firstChild
                && $Einstellungen.template.megamenu.show_category_images !== 'N'
                && (!$isMobile || $isTablet)}
                {$imgAlt = $mainCategory->getAttribute('img_alt')}
                {include file='snippets/image.tpl'
                    class='submenu-headline-image'
                    item=$mainCategory
                    square=false
                    srcSize='sm'
                    alt="{if empty($imgAlt->cWert)}{$mainCategory->getName()|escape:'html'}{else}{$imgAlt->cWert}{/if}"}
            {/if}
            <span class="text-truncate d-block">
                {$mainCategory->getShortName()}{if $mainCategory->hasChildren() && $subCategory >= $max_subsub_items}<span class="more-subcategories">&nbsp;({$mainCategory->getChildren()|count})</span>{/if}
            </span>
        </div>
    {/block}
{/if}