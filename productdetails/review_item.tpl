
{block name='productdetails-review-itme-helpful'}
    
{/block}
{block name='productdetails-review-item-review'}
    {col cols=12 itemprop="reviewRating" itemscope=true itemtype="https://schema.org/Rating"}
        {block name='productdetails-review-item-rating'}
            {block name='productdetails-review-item-include-rating'}
                {include file='productdetails/rating.tpl' stars=$oBewertung->nSterne}
            {/block}
            <small class="d-none">
                <span itemprop="ratingValue">{$oBewertung->nSterne}</span> {lang key='from'}
                <span itemprop="bestRating">5</span>
                <meta itemprop="worstRating" content="1">
            </small>
             - <span class="h3"><strong>{$oBewertung->cName}</strong></span>
        {/block}
        {if $Einstellungen.bewertung.bewertung_hilfreich_anzeigen === 'Y'}
            {if JTL\Session\Frontend::getCustomer()->getID() > 0 && JTL\Session\Frontend::getCustomer()->getID() !== $oBewertung->kKunde}
                {block name='productdetails-review-item-buttons'}
                   
                {/block}
            {/if}
        {/if}
        <hr>
    {/col}
{/block}
{block name='productdetails-review-item-details'}
    {col cols=12}
        <blockquote>
           
            <p itemprop="reviewBody">{$oBewertung->cText|nl2br}</p>
            <div class="blockquote-footer d-none">
                <span itemprop="author" itemscope itemtype="https://schema.org/Person">
                    <span itemprop="name">{$oBewertung->cName}</span>
                </span>
                <meta itemprop="datePublished" content="{$oBewertung->dDatum}" />{$oBewertung->Datum}
                {block name='productdetails-review-item-details-verified-purchase'}
                    {if !empty($oBewertung->wasPurchased)}
                        <span class="blockquote-divider"></span>
                        <span class="verified-purchase">{lang key='verifiedPurchase' section='product rating'}</span>
                    {/if}
                {/block}
            </div>
        </blockquote>
        <meta itemprop="thumbnailURL" content="{$Artikel->cVorschaubildURL}">
        {if !empty($oBewertung->cAntwort)}
            <div class="review-reply">
                
                <blockquote>
                    <p>{$oBewertung->cAntwort}</p>
                    <div class="blockquote-footer">{$oBewertung->AntwortDatum}</div>
                </blockquote>
            </div>
        {/if}
    {/col}
{/block}
               