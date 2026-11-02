{block name='productdetails-price-uvp'}
    <div class="suggested-price">
        <span>{lang key='suggestedPrice' section='productDetails'}</span>:
        <span class="value text-nowrap-util">{$Artikel->getUVPLocalized(0)} (Brutto)</span>
    </div>
    {* Preisersparnis zur UVP anzeigen? *}
    {if isset($Artikel->SieSparenX) && $Artikel->SieSparenX->anzeigen == 1 && $Artikel->SieSparenX->nProzent > 0}
        <div class="yousave">({lang key='youSave' section='productDetails'}
            <span class="percent">{$Artikel->SieSparenX->nProzent}%</span>, {lang key='thatIs' section='productDetails'}
            <span class="value text-nowrap-util">{$Artikel->SieSparenX->cLocalizedSparbetrag}</span>)
        </div>
    {/if}
{/block}