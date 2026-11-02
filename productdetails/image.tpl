{block name='productdetails-image-actions'}
    {* moved to details *}

    {*black friday
    {if $Artikel->Preise->Sonderpreis_aktiv}
        <div class="black-friday-badge position-absolute">
            <img src="/bilder/custom_badge/smoke2u_black-friday_badge.png" alt="Black Friday Angebot für {$Artikel->cName}">
        </div>
    {/if}
    black friday end*}
{/block}

{* Megabar: danger skull. NOVA renders 'productdetails-image-actions' only for non-parent articles, so on
   variation parents the skull was missing. Prepending it to the next block in the same column keeps the
   exact same position for all products. *}
{block name='productdetails-image-images-wrapper' prepend}
    <div class="danger-symbol-array dangersym_smoke2u position-absolute">
    {* Megabar: Pods, Starter-Sets, Nikotinsalz *}
        {$showDanger = false}
        {if isset($Artikel->oKategorie_arr) && !empty($Artikel->oKategorie_arr)}
            {foreach ['2346','2348','2334','2337','2340','2336','2339','2342','2344'] as $dangerCat}
                {if in_array($dangerCat, $Artikel->oKategorie_arr)}{$showDanger = true}{/if}
            {/foreach}
        {/if}
        {if $Artikel->kVersandklasse == "5" || $showDanger}
            <img src="/templates/Megabar/themes/smoke2u/gfx/gefahrensymbol_smoke2u.svg" width="75" height="75" alt="Gefahr!">
            <span>Gefahr!</span>
        {/if}
    </div>
    
{/block}

{* Megabar Speed: overrides NOVA block 'productdetails-image-images'.
   Only the first (LCP) image changes: plain <picture> with fetchpriority="high",
   real sizes, width/height, and phones (< 768px) capped at the 600px "md" file
   instead of the 1200px "lg" file. Images 2+ render exactly like NOVA 5.8.2.
   Fullscreen/zoom still uses the lg file from data-list. *}
{block name='productdetails-image-images'}
    {foreach $Artikel->Bilder as $image}
        {strip}
            <div class="square square-image js-gallery-images {if !$image@first}d-none{/if}">
                <div class="inner">
                    {if $image@first}
                        {$mbSizes = '(min-width: 992px) 50vw, calc(100vw - 2rem)'}
                        {$mbWebpXs = $image->cURLMini|regex_replace:'/\.(jpe?g|png)$/i':'.webp'}
                        {$mbWebpSm = $image->cURLKlein|regex_replace:'/\.(jpe?g|png)$/i':'.webp'}
                        {$mbWebpMd = $image->cURLNormal|regex_replace:'/\.(jpe?g|png)$/i':'.webp'}
                        {$mbWebpLg = $image->cURLGross|regex_replace:'/\.(jpe?g|png)$/i':'.webp'}
                        {$mbWXs = $image->imageSizes->xs->size->width}
                        {$mbWSm = $image->imageSizes->sm->size->width}
                        {$mbWMd = $image->imageSizes->md->size->width}
                        {$mbWLg = $image->imageSizes->lg->size->width}
                        <picture>
                            {if $mbWebpLg !== $image->cURLGross}
                                <source media="(max-width: 767.98px)" type="image/webp" sizes="calc(100vw - 2rem)" srcset="{$mbWebpXs} {$mbWXs}w, {$mbWebpSm} {$mbWSm}w, {$mbWebpMd} {$mbWMd}w">
                                <source type="image/webp" sizes="{$mbSizes}" srcset="{$mbWebpXs} {$mbWXs}w, {$mbWebpSm} {$mbWSm}w, {$mbWebpMd} {$mbWMd}w, {$mbWebpLg} {$mbWLg}w">
                            {/if}
                            <source media="(max-width: 767.98px)" sizes="calc(100vw - 2rem)" srcset="{$image->cURLMini} {$mbWXs}w, {$image->cURLKlein} {$mbWSm}w, {$image->cURLNormal} {$mbWMd}w">
                            <img src="{$image->cURLNormal}" srcset="{$image->cURLMini} {$mbWXs}w, {$image->cURLKlein} {$mbWSm}w, {$image->cURLNormal} {$mbWMd}w, {$image->cURLGross} {$mbWLg}w" sizes="{$mbSizes}" width="{$mbWLg}" height="{$image->imageSizes->lg->size->height}" fetchpriority="high" class="product-image img-fluid" alt="{$image->cAltAttribut|escape:'html':'UTF-8':false}" data-list="{$image->galleryJSON|escape:'html'}" data-index="{$image@index}">
                        </picture>
                    {else}
                        {image alt=$image->cAltAttribut
                            class="product-image"
                            fluid=true
                            lazy=true
                            webp=true
                            src="{$image->cURLMini}"
                            srcset="
                                {$image->cURLMini} {$image->imageSizes->xs->size->width}w,
                                {$image->cURLKlein} {$image->imageSizes->sm->size->width}w,
                                {$image->cURLNormal} {$image->imageSizes->md->size->width}w,
                                {$image->cURLGross} {$image->imageSizes->lg->size->width}w"
                            data=["list"=>"{$image->galleryJSON|escape:"html"}", "index"=>$image@index]
                        }
                    {/if}
                </div>
            </div>
        {/strip}
    {/foreach}
{/block}
