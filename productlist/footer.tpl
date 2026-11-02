{block name='productlist-footer' append}
{if $boxesLeftActive}
{else}
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
{/if}
{/block}
