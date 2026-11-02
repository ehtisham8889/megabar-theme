{* Megabar Startseite (neues Layout, Vorlage: Claude Design "Megabar Startseite v3").
   Wird nur angezeigt, wenn Template-Einstellung "Neue Startseite" = An, oder = Vorschau und die URL ?mbnew=1 enthaelt
   (siehe snippets/mb_home_on.tpl). Header, Menue, Footer, Altersabfrage bleiben unveraendert.

   Alles kommt aus den vorhandenen Shop-Daten, in der Wawi muss nichts gepflegt werden:
   - Preise "ab": guenstigster Artikel der jeweiligen Kategorie (je 1 Artikel, schnell)
   - Sorten-Raster: die 12 meistverkauften Artikel der Kategorie GT 22000 > Pods, mit der normalen Shop-Produktkachel
   - Geschmacks-Filter: wird im Browser aus dem Artikelnamen abgeleitet (Ice, Beere, Getraenke, Frucht ...)
   Kategorie-IDs (aus dem Shop-Menue): *}
{$mbCatGT22      = 2332}{* GT 22000 *}
{$mbCatGT22Pods  = 2334}{* GT 22000 > Pods *}
{$mbCatGT22Akku  = 2335}{* GT 22000 > Akkutraeger *}
{$mbCatGTMax     = 2331}{* GT Max 15000 *}
{$mbCatGTMaxPods = 2337}{* GT Max 15000 > Pods *}
{$mbCatGTMaxAkku = 2338}{* GT Max 15000 > Akkutraeger *}
{$mbCatSlimSets  = 2342}{* Slim 12K > Starter-Sets *}
{$mbCatAllSets   = 2348}{* Alle Starter-Sets *}
{$mbGfx = "{$ShopURL}/templates/Megabar/themes/smoke2u/gfx"}
{$mbOpc = "{$ShopURL}/media/image/storage/opc"}
{$mbHome = "{$mbGfx}/home"}{* Banner und Kacheln vom Designer *}

{* Startseiten-Banner oben: 1 = ein Bild ueber die volle Breite, 0 = bisheriger dunkler Hero (Rollback).
   Link leer lassen = Banner nicht klickbar. *}
{$mbBannerOn  = 1}
{$mbBannerUrl = "{$ShopURL}/GT-22000"}
{$mbBannerAlt = 'Megabar GT 22000 Akkuträger und Pods: Pod inklusive Akku jetzt für nur 9,99 €'}
{* Kacheln unter dem Banner (je 600x417). url leer = Kachel nicht klickbar (z. B. solange es die Kategorie noch nicht gibt). *}
{$mbTiles = [
    ['img'=>'mb-tile-gt22000-20mg.webp',         'url'=>"{$ShopURL}/Pods",          'alt'=>'Megabar GT22000 Pods mit 20 mg Nikotin, 22 Sorten'],
    ['img'=>'mb-tile-megaliq-20mg.webp',         'url'=>'',                         'alt'=>'Megaliq Liquids mit 20 mg Nikotin, 15 Sorten'],
    ['img'=>'mb-tile-gtmax-akku.webp',           'url'=>"{$ShopURL}/Akkutraeger_1", 'alt'=>'Megabar GT Max Akkuträger in 4 Farben'],
    ['img'=>'mb-tile-gt22000plus-airflow.webp',  'url'=>'',                         'alt'=>'Megabar GT22000+ Airflow+ in 3 Farben']
]}

{* je 1 guenstigster Artikel pro Kategorie, fuer die "ab"-Preise *}
{get_product_list kKategorie=$mbCatGT22Pods  nLimit=1 nSortierung=$smarty.const.SEARCH_SORT_PRICE_ASC cAssign='mbMinGT22Pod'}
{get_product_list kKategorie=$mbCatGT22Akku  nLimit=1 nSortierung=$smarty.const.SEARCH_SORT_PRICE_ASC cAssign='mbMinGT22Akku'}
{get_product_list kKategorie=$mbCatGTMaxPods nLimit=1 nSortierung=$smarty.const.SEARCH_SORT_PRICE_ASC cAssign='mbMinGTMaxPod'}
{get_product_list kKategorie=$mbCatGTMaxAkku nLimit=1 nSortierung=$smarty.const.SEARCH_SORT_PRICE_ASC cAssign='mbMinGTMaxAkku'}
{get_product_list kKategorie=$mbCatSlimSets  nLimit=1 nSortierung=$smarty.const.SEARCH_SORT_PRICE_ASC cAssign='mbMinSlimSet'}
{get_product_list kKategorie=$mbCatAllSets   nLimit=1 nSortierung=$smarty.const.SEARCH_SORT_PRICE_ASC cAssign='mbMinSet'}
{* Sorten-Raster: die 12 beliebtesten GT 22000 Pods. 12 statt aller Sorten haelt die Seite so schnell wie die bisherige
   Startseite (getestet: 23 Kacheln = +0,15 s auf dem Handy, 12 Kacheln = gleich schnell). *}
{get_product_list kKategorie=$mbCatGT22Pods nLimit=12 nSortierung=$smarty.const.SEARCH_SORT_BESTSELLER cAssign='mbPods'}

{$mbSeries = [
    ['name'=>'GT 22000',     'url'=>"{$ShopURL}/GT-22000",     'tag'=>'Meiste Sorten', 'img'=>"{$mbOpc}/megabar-gt-22000-akkutraeger-black.webp", 'alt'=>'Megabar GT 22000 Akkuträger in Schwarz', 'puffs'=>'bis 22.000', 'bat'=>'1400 mAh', 'pod'=>'10 ml', 'p1l'=>'Pods ab', 'p1'=>$mbMinGT22Pod,  'p2l'=>'Akkuträger ab', 'p2'=>$mbMinGT22Akku],
    ['name'=>'GT Max 15000', 'url'=>"{$ShopURL}/GT-Max-15000", 'tag'=>'Alu-Gehäuse',   'img'=>"{$mbHome}/mb-card-gtmax.webp",                'alt'=>'Megabar GT Max Akkuträger in Silver Gray','puffs'=>'bis 15.000', 'bat'=>'1400 mAh', 'pod'=>'10 ml', 'p1l'=>'Pods ab', 'p1'=>$mbMinGTMaxPod, 'p2l'=>'Akkuträger ab', 'p2'=>$mbMinGTMaxAkku],
    ['name'=>'Slim 12K',     'url'=>"{$ShopURL}/Slim-12K",     'tag'=>'Kompakt',       'img'=>"{$mbOpc}/megabar-slim-starter-kit-watermelon.webp", 'alt'=>'Megabar Slim 12K Starter Kit',         'puffs'=>'bis 12.000', 'bat'=>'600 mAh',  'pod'=>'6 ml',  'p1l'=>'Starter-Set ab', 'p1'=>$mbMinSlimSet, 'p2l'=>'', 'p2'=>[]]
]}

{$mbFaq = [
    ['Wie viele Züge hat ein Megabar Pod?', 'Je nach Serie bis zu 22.000 (GT 22000), 15.000 (GT Max) oder 12.000 (Slim 12K). Die tatsächliche Zahl hängt vom Zugverhalten ab.'],
    ['Sind die Pods nachfüllbar?', 'Nein. GT 22000 und GT Max Pods sind mit 10 ml vorbefüllt, Slim 12K Pods mit 6 ml. Leere Pods tauschst du einfach gegen neue aus.'],
    ['Passen GT 22000 Pods in den GT Max?', 'Ja. GT 22000 und GT Max Pods passen in alle GT-Akkuträger (GT 22000, GT Max und GT 15000). Nur die Slim 12K hat eigene Pods, siehe Übersicht oben.'],
    ['Welche Nikotinstärke haben die Pods?', 'Die Megabar Pods in unserem Shop enthalten 20 mg/ml Nikotin.'],
    ['Wie schnell wird geliefert?', 'Die Lieferung erfolgt innerhalb von 1 bis 3 Werktagen mit DHL 18+. Ab 49 € ist der Versand innerhalb Deutschlands kostenlos.']
]}

<div class="mb-home">
{literal}<style>
/* bisherige Startseite (OPC-Inhalt mit Klasse .mbl) ausblenden, solange die neue gezeigt wird */
#main-wrapper .mbl{display:none!important}
.mb-home{--mb-red:#e0231d;--mb-dark:#b90000;--mb-bg:#f5f7fa;--mb-line:#eaeaea;color:#000}
/* nur eigene Bilder; die Produktkacheln behalten exakt ihr Theme-CSS (z. B. 75px Gefahrensymbol) */
.mb-hero__img,.mb-card__img img,.mb-promo img{max-width:100%;height:auto}
.mb-sec{padding:3rem 0}
@media (min-width:992px){.mb-sec{padding:4.5rem 0}}
.mb-sec--light{background:var(--mb-bg)}
.mb-sec--white{background:#fff}
.mb-sec--dark{background:linear-gradient(125deg,#080808 0%,#181818 55%,#4a0c0a 100%);color:#fff}
.mb-kicker{color:var(--mb-red);font-weight:700;font-size:.8125rem;letter-spacing:.12em;text-transform:uppercase;margin-bottom:.5rem}
.mb-sec--dark .mb-kicker{color:#ff6b62}
.mb-h1{-webkit-hyphens:manual!important;hyphens:manual!important;overflow-wrap:normal;font-weight:800;text-transform:uppercase;line-height:1.05;font-size:clamp(2rem,5vw,3.5rem);margin:0 0 1rem;color:#fff}
.mb-h1 span{color:#ff6b62}
.mb-h2{-webkit-hyphens:manual!important;hyphens:manual!important;font-weight:700;line-height:1.15;font-size:clamp(1.5rem,3vw,2.25rem);margin:0 0 .75rem}
.mb-lead{font-size:1.0625rem;color:#333;max-width:44rem}
.mb-sec--dark .mb-lead{color:#e6e6e6}
.mb-head{display:flex;flex-wrap:wrap;justify-content:space-between;align-items:flex-end;gap:1rem;margin-bottom:2rem}
.mb-head .mb-lead{margin:0}
.mb-btns{display:flex;flex-wrap:wrap;gap:.75rem;margin:1.5rem 0}
.mb-btns .btn{border-radius:2rem;font-weight:600;padding:.75rem 1.5rem}
.mb-stats{display:flex;flex-wrap:wrap;gap:1rem 1.5rem;margin-top:1.5rem;padding-top:1.5rem;border-top:1px solid rgba(255,255,255,.18)}
.mb-stats b{display:block;font-size:1.25rem;font-weight:800;line-height:1}
.mb-stats small{color:#cfcfcf;font-size:.75rem}
@media (min-width:576px){.mb-stats{gap:1.5rem 2.5rem}.mb-stats b{font-size:1.5rem}.mb-stats small{font-size:.8125rem}}
.mb-hero__img{border-radius:.5rem;box-shadow:0 1rem 2.5rem rgba(0,0,0,.4)}
.mb-trust{background:#fff;border-bottom:1px solid var(--mb-line)}
.mb-trust ul{display:flex;flex-wrap:wrap;justify-content:space-between;gap:.75rem 1.5rem;list-style:none;margin:0;padding:1rem 0;font-size:.875rem;font-weight:500}
.mb-trust li{display:flex;align-items:center;gap:.5rem}
.mb-trust img{width:20px;height:auto}
.mb-cards{display:grid;gap:1.5rem;grid-template-columns:1fr}
@media (min-width:768px){.mb-cards{grid-template-columns:repeat(3,1fr)}}
@media (min-width:768px){.mb-cards--2{grid-template-columns:repeat(2,1fr)}.mb-cards--2 .mb-card__img img{max-width:340px}}
.mb-card{display:flex;flex-direction:column;background:#fff;border:1px solid var(--mb-line);border-radius:.75rem;overflow:hidden;color:#000;text-decoration:none!important;transition:box-shadow .2s,transform .2s}
.mb-card:hover{box-shadow:0 .75rem 2rem rgba(0,0,0,.1);transform:translateY(-2px);color:#000}
.mb-card__img{position:relative;background:#fff;padding:1rem}
.mb-card__img img{display:block;margin:0 auto;aspect-ratio:1/1;object-fit:contain}
.mb-pill{position:absolute;top:1rem;left:1rem;background:#000;color:#fff;font-size:.75rem;font-weight:600;border-radius:2rem;padding:.25rem .75rem}
.mb-card__body{padding:0 1.25rem 1.25rem;display:flex;flex-direction:column;flex:1}
.mb-card__body h3{font-size:1.375rem;font-weight:700;margin:.25rem 0 1rem}
.mb-specs{display:grid;grid-template-columns:1fr 1fr;gap:.75rem 1rem;margin:0 0 1.25rem;font-size:.875rem}
.mb-specs dt{font-weight:400;color:#555;font-size:.75rem;text-transform:uppercase;letter-spacing:.06em}
.mb-specs dd{margin:0;font-weight:600}
.mb-specs .mb-price{color:var(--mb-red)}
.mb-card__cta{margin-top:auto;font-weight:600;color:var(--mb-red)}
.mb-promo{border-radius:.75rem;overflow:hidden;background:linear-gradient(110deg,#090909,#9c1914);color:#fff}
.mb-promo .row{align-items:center}
.mb-promo .row>.mb-promo__copy{padding:2rem 1.5rem}
@media (min-width:992px){.mb-promo .row>.mb-promo__copy{padding:3rem}}
.mb-promo__copy .mb-h2{color:#fff}
.mb-promo img{display:block;width:100%}
.mb-chips{display:flex;gap:.5rem;overflow-x:auto;padding-bottom:.25rem;margin-bottom:1.5rem;scrollbar-width:none}
.mb-chips::-webkit-scrollbar{display:none}
.mb-chip{flex:0 0 auto;border:1px solid #000;background:#fff;color:#000;border-radius:2rem;padding:.5rem 1rem;font-size:.875rem;font-weight:500;min-height:44px;cursor:pointer}
.mb-chip small{opacity:.6;margin-left:.25rem}
.mb-chip.is-active{background:#000;color:#fff}
.mb-more{display:flex;flex-wrap:wrap;gap:.75rem;justify-content:center;margin-top:1.5rem}
.mb-more .btn{border-radius:2rem;font-weight:600}
.mb-table{overflow-x:auto;background:#fff;border:1px solid var(--mb-line);border-radius:.75rem}
.mb-table table{width:100%;border-collapse:collapse;font-size:.9375rem;min-width:30rem}
.mb-table th,.mb-table td{padding:.875rem 1rem;border-bottom:1px solid var(--mb-line);text-align:center}
.mb-table thead th{background:#000;color:#fff;font-weight:600}
.mb-table tbody th{text-align:left;font-weight:600}
.mb-table tr:last-child>*{border-bottom:0}
.mb-table .y{color:#1c871e;font-weight:700}
.mb-table .n{color:#999}
.mb-steps{display:grid;gap:1.5rem;grid-template-columns:1fr;list-style:none;padding:0;margin:2rem 0 0}
@media (min-width:768px){.mb-steps{grid-template-columns:repeat(3,1fr)}}
.mb-steps li{background:#fff;border:1px solid var(--mb-line);border-radius:.75rem;padding:1.5rem}
.mb-steps span{display:inline-flex;align-items:center;justify-content:center;width:2.5rem;height:2.5rem;border-radius:50%;background:var(--mb-red);color:#fff;font-weight:700;margin-bottom:1rem}
.mb-steps h3{font-size:1.125rem;font-weight:700;margin:0 0 .5rem}
.mb-steps p{margin:0;color:#333}
.mb-faq details{background:#fff;border:1px solid var(--mb-line);border-radius:.5rem;margin-bottom:.75rem}
.mb-faq summary{cursor:pointer;list-style:none;padding:1rem 3rem 1rem 1.25rem;font-weight:600;position:relative;min-height:44px}
.mb-faq summary::-webkit-details-marker{display:none}
.mb-faq summary::after{content:"+";position:absolute;right:1.25rem;top:50%;transform:translateY(-50%);font-size:1.25rem;color:var(--mb-red)}
.mb-faq details[open] summary::after{content:"\2013"}
.mb-faq details p{margin:0;padding:0 1.25rem 1.25rem;color:#333}
.mb-seo{columns:1;column-gap:3rem;color:#333}
@media (min-width:992px){.mb-seo{columns:2}}
.mb-warning{background:#000;color:#fff;text-align:center;font-weight:600;padding:1rem;font-size:.9375rem}
.mb-card__tag,.mb-showmore{display:none}
/* Banner ueber die volle Breite; Breite/Hoehe am Bild verhindern Layout-Verschiebung */
.mb-banner{background:#1a0000}
.mb-banner a,.mb-banner img{display:block}
.mb-banner img{width:100%;height:auto}
.mb-tiles{display:grid;gap:.625rem;padding:.625rem;grid-template-columns:repeat(2,1fr);background:#fff}
@media (min-width:992px){.mb-tiles{grid-template-columns:repeat(4,1fr)}}
.mb-tile{display:block;border-radius:.75rem;overflow:hidden;box-shadow:0 .25rem 1rem rgba(0,0,0,.08);transition:box-shadow .2s,transform .2s}
a.mb-tile:hover{box-shadow:0 .75rem 2rem rgba(0,0,0,.15);transform:translateY(-2px)}
.mb-tile img{display:block;width:100%;height:auto}
/* ---------- Handy (bis 767px): kompakte Abstaende, Banner zuerst, Serien als Zeilen, Tabelle ohne Scrollen ---------- */
@media (max-width:767.98px){
.mb-sec{padding:2rem 0}
.mb-sec--dark{padding:1rem 0 1.5rem}
.mb-tiles{gap:.5rem;padding:.5rem}
.mb-tile{border-radius:.5rem}
.mb-kicker{font-size:.6875rem;margin-bottom:.375rem}
.mb-h1{font-size:1.75rem;margin-bottom:.5rem}
.mb-h2{font-size:1.375rem;margin-bottom:.5rem}
.mb-lead{font-size:.9375rem}
.mb-head{margin-bottom:1rem;gap:.5rem}
.mb-btns{gap:.5rem;margin:1rem 0 0}
.mb-btns .btn{flex:1 1 0;padding:.75rem .5rem;font-size:.875rem;white-space:nowrap}
.mb-stats{display:grid;grid-template-columns:repeat(4,1fr);gap:.5rem;margin-top:1rem;padding-top:1rem}
.mb-stats b{font-size:1.0625rem}
.mb-stats small{display:block;font-size:.6875rem;line-height:1.2;margin-top:.125rem}
.mb-hero__img{box-shadow:none;width:100%}
.mb-trust ul{display:grid;grid-template-columns:1fr 1fr;gap:.5rem .75rem;padding:.75rem 0;font-size:.75rem}
.mb-trust img{width:16px}
.mb-cards{gap:.75rem}
.mb-card{flex-direction:row}
.mb-card__img{flex:0 0 112px;padding:.5rem;display:flex;align-items:center;border-right:1px solid var(--mb-line)}
.mb-card__img img{width:100%}
.mb-pill{display:none}
.mb-card__tag{display:inline-block;align-self:flex-start;background:#000;color:#fff;font-size:.625rem;font-weight:600;border-radius:2rem;padding:.125rem .5rem;margin-bottom:.25rem}
.mb-card__body{padding:.75rem .875rem}
.mb-card__body h3{font-size:1rem;margin:0 0 .375rem}
.mb-specs{grid-template-columns:1fr;gap:.125rem;margin:0 0 .5rem;font-size:.8125rem}
.mb-specs div{display:flex;justify-content:space-between;align-items:baseline;gap:.5rem}
.mb-specs dt{font-size:.6875rem;letter-spacing:.03em}
.mb-card__cta{font-size:.875rem}
.mb-promo .row>.mb-promo__copy{padding:1rem}
.mb-promo .mb-h2{font-size:1.0625rem}
.mb-promo .mb-lead{display:none}
.mb-promo .mb-btns{margin-top:.75rem}
.mb-promo .mb-btns .btn{flex:0 0 auto;padding:.5rem 1rem}
.mb-chips{margin-bottom:1rem}
.mb-collapsed>[data-mb-name]:nth-child(n+7){display:none}
.mb-showmore{display:block;width:100%;margin-top:.25rem;border-radius:2rem;font-weight:600}
.mb-more{gap:.5rem;margin-top:1rem}
.mb-more .btn{flex:1 1 calc(50% - .25rem);font-size:.875rem}
.mb-more .btn:first-child{flex-basis:100%}
.mb-table table{min-width:0;font-size:.8125rem}
.mb-table th,.mb-table td{padding:.625rem .375rem}
.mb-table thead th{font-size:.75rem;line-height:1.2}
.mb-table tbody th{padding-left:.75rem}
.mb-pass{display:none}
.mb-steps{gap:.625rem;margin-top:1rem}
.mb-steps li{display:grid;grid-template-columns:2.25rem 1fr;column-gap:.75rem;padding:1rem}
.mb-steps span{width:2.25rem;height:2.25rem;margin:0;grid-row:span 2}
.mb-steps h3{font-size:1rem;margin:0 0 .125rem}
.mb-steps p{font-size:.875rem}
.mb-faq summary{padding:.875rem 2.5rem .875rem 1rem;font-size:.9375rem}
.mb-faq details{margin-bottom:.5rem}
.mb-faq details p{padding:0 1rem 1rem;font-size:.9375rem}
.mb-seo{font-size:.9375rem}
.mb-warning{font-size:.8125rem;padding:.75rem}
}
</style>{/literal}

    {opcMountPoint id='mb_home_top' inContainer=false}

    {if $mbBannerOn}
    {* ---------- BANNER: ein Bild ueber die volle Breite, komplett klickbar ---------- *}
    <h1 class="sr-only">Megabar Pod-System mit bis zu 22.000 Zügen</h1>
    <div class="mb-banner">
        {if $mbBannerUrl}<a href="{$mbBannerUrl}">{/if}
        <picture>
            {* Handy-Banner (1080x1350), sobald vom Designer geliefert, hier einkommentieren:
            <source media="(max-width: 767.98px)" srcset="{$mbHome}/mb-banner-startseite-mobile.webp" width="1080" height="1350"> *}
            <img src="{$mbHome}/mb-banner-startseite.webp" srcset="{$mbHome}/mb-banner-startseite-960.webp 960w, {$mbHome}/mb-banner-startseite.webp 1920w" sizes="100vw" width="1920" height="588" loading="eager" fetchpriority="high" decoding="async" alt="{$mbBannerAlt}">
        </picture>
        {if $mbBannerUrl}</a>{/if}
    </div>

    {* ---------- KACHELN (Bilder vom Designer), gleiche Breite wie der Banner ---------- *}
    <div class="mb-tiles">
        {foreach $mbTiles as $t}
            {if $t.url}<a class="mb-tile" href="{$t.url}">{else}<div class="mb-tile">{/if}
                <img src="{$mbHome}/{$t.img}" width="600" height="417" loading="lazy" decoding="async" alt="{$t.alt}">
            {if $t.url}</a>{else}</div>{/if}
        {/foreach}
    </div>
    {else}
    {* ---------- HERO (bisherig, Rollback mit $mbBannerOn = 0) ---------- *}
    <section class="mb-sec mb-sec--dark">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-lg-6 order-lg-2 mb-3 mb-lg-0 text-center">
                    <a href="{$ShopURL}/GT-22000">
                        <img class="mb-hero__img" src="{$mbOpc}/megabar-22k-vape-20-sorten-angebot.webp" width="600" height="417" fetchpriority="high" decoding="async" alt="Megabar GT 22000 Pods und Akkuträger">
                    </a>
                </div>
                <div class="col-12 col-lg-6 order-lg-1">
                    <div class="mb-kicker">Offizieller Megabar Shop</div>
                    <h1 class="mb-h1">Megabar Pod-System mit bis zu <span>22.000</span> Zügen</h1>
                    <p class="mb-lead">Wiederaufladbarer Akkuträger und vorbefüllte Pods. Einmal das Gerät wählen, danach nur noch den Pod wechseln.</p>
                    <div class="mb-btns">
                        <a class="btn btn-primary btn-lg" href="#mb-systeme">System finden</a>
                        <a class="btn btn-outline-light btn-lg" href="{$ShopURL}/Alle-Starter-Sets">Starter-Sets{if !empty($mbMinSet)} ab {$mbMinSet[0]->Preise->cVKLocalized[$NettoPreise]}{/if}</a>
                    </div>
                    <div class="mb-stats">
                        <div><b>22K</b><small>Züge max.</small></div>
                        <div><b>10 ml</b><small>Pod-Füllung (GT)</small></div>
                        <div><b>USB-C</b><small>Aufladbar</small></div>
                        <div><b>20 mg</b><small>Nikotin</small></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    {/if}

    {* ---------- SYSTEME ---------- *}
    <section class="mb-sec mb-sec--light" id="mb-systeme">
        <div class="container">
            <div class="mb-head">
                <div>
                    <div class="mb-kicker">01 · Finde dein System</div>
                    <h2 class="mb-h2">Drei Serien. Ein Prinzip.</h2>
                </div>
                <p class="mb-lead">GT 22000 und GT Max Pods passen in alle GT-Akkuträger, die Slim 12K hat eigene Pods. Wähle zuerst das Gerät, die passenden Sorten findest du danach auf der Serienseite.</p>
            </div>
            {* Serien ohne Artikel im Shop (kein "ab"-Preis gefunden) werden ausgeblendet und erscheinen automatisch wieder *}
            {$mbCardCount = 0}{foreach $mbSeries as $s}{if !empty($s.p1)}{$mbCardCount = $mbCardCount + 1}{/if}{/foreach}
            <div class="mb-cards mb-cards--{$mbCardCount}">
                {foreach $mbSeries as $s}{if empty($s.p1)}{continue}{/if}
                    <a class="mb-card" href="{$s.url}">
                        <div class="mb-card__img">
                            <img src="{$s.img}" width="640" height="640" loading="lazy" decoding="async" alt="{$s.alt}">
                            <span class="mb-pill">{$s.tag}</span>
                        </div>
                        <div class="mb-card__body">
                            <span class="mb-card__tag">{$s.tag}</span>
                            <h3>Megabar {$s.name}</h3>
                            <dl class="mb-specs">
                                <div><dt>Züge</dt><dd>{$s.puffs}</dd></div>
                                <div><dt>Akku</dt><dd>{$s.bat}</dd></div>
                                <div><dt>Pod</dt><dd>{$s.pod}</dd></div>
                                {if !empty($s.p1)}<div><dt>{$s.p1l}</dt><dd class="mb-price">{$s.p1[0]->Preise->cVKLocalized[$NettoPreise]}</dd></div>{/if}
                                {if !empty($s.p2)}<div><dt>{$s.p2l}</dt><dd class="mb-price">{$s.p2[0]->Preise->cVKLocalized[$NettoPreise]}</dd></div>{/if}
                            </dl>
                            <span class="mb-card__cta">{$s.name} ansehen &rarr;</span>
                        </div>
                    </a>
                {/foreach}
            </div>
        </div>
    </section>

    {* ---------- AKTION (Text wie auf der bisherigen Startseite) ---------- *}
    <section class="mb-sec mb-sec--white">
        <div class="container">
            <div class="mb-promo">
                <div class="row no-gutters">
                    <div class="col-7 mb-promo__copy">
                        <div class="mb-kicker" style="color:#ff6b62">Bundle-Aktion</div>
                        <h2 class="mb-h2">2 Pods kaufen. Akkuträger gratis.</h2>
                        <p class="mb-lead" style="color:#eee">Zwei Pods aus dem teilnehmenden Sortiment in den Warenkorb legen, der Akkuträger kommt gratis dazu.</p>
                        <div class="mb-btns mb-0">
                            <a class="btn btn-light btn-lg" href="{$ShopURL}/Alle-Pods">Pods auswählen</a>
                        </div>
                    </div>
                    <div class="col-5">
                        <img src="{$mbHome}/mb-promo-kaufe-2-pods.webp" srcset="{$mbHome}/mb-promo-kaufe-2-pods-500.webp 500w, {$mbHome}/mb-promo-kaufe-2-pods.webp 1000w" sizes="(min-width: 1250px) 510px, 42vw" width="1000" height="1000" loading="lazy" decoding="async" alt="Megabar Aktion: kaufe 2 Megabar Pods und erhalte einen Akku gratis">
                    </div>
                </div>
            </div>
        </div>
    </section>

    {* ---------- SORTEN: normale Shop-Produktkachel (Warenkorb, Preise, Gefahrensymbol wie auf Kategorieseiten) ---------- *}
    {if !empty($mbPods)}
    <section class="mb-sec mb-sec--light" id="mb-sorten">
        <div class="container">
            <div class="mb-head">
                <div>
                    <div class="mb-kicker">02 · Beliebte Sorten GT 22000</div>
                    <h2 class="mb-h2">Finde deine Sorte.</h2>
                </div>
                <a class="btn btn-outline-primary d-none d-md-inline-block" href="{$ShopURL}/Pods" style="border-radius:2rem">Alle GT 22000 Pods &rarr;</a>
            </div>
            <div class="mb-chips" id="mb-chips" role="group" aria-label="Sorten nach Geschmack filtern"></div>
            <div class="row product-list layout-gallery{if $mbPods|count > 6} mb-collapsed{/if}" id="product-list">
                {foreach $mbPods as $Artikel}
                    <div class="col product-wrapper col-6 col-sm-6 col-md-4 col-xl-3" data-mb-name="{$Artikel->cName|escape:'html'}" itemprop="itemListElement" itemscope itemtype="https://schema.org/Product">
                        {include file='productlist/item_box.tpl' tplscope='gallery'}
                    </div>
                {/foreach}
            </div>
            {if $mbPods|count > 6}<button type="button" class="btn btn-outline-primary mb-showmore" id="mb-showmore">Weitere Sorten anzeigen</button>{/if}
            <div class="mb-more">
                <a class="btn btn-primary" href="{$ShopURL}/Pods">Alle GT 22000 Pods</a>
                <a class="btn btn-outline-primary" href="{$ShopURL}/Pods_1">GT Max Pods</a>
                <a class="btn btn-outline-primary" href="{$ShopURL}/Alle-Starter-Sets">Starter-Sets</a>
            </div>
            <p class="small text-muted-util mt-3 mb-0">* Alle Preise inkl. gesetzl. USt., zzgl. Versand.</p>
        </div>
    </section>
    {/if}

    {* ---------- KOMPATIBILITAET ---------- *}
    <section class="mb-sec mb-sec--white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-lg-4 mb-3 mb-lg-0">
                    <div class="mb-kicker">03 · Kompatibilität</div>
                    <h2 class="mb-h2">Welcher Pod passt in welchen Akkuträger?</h2>
                    <p class="mb-lead">GT 22000 und GT Max Pods sind untereinander kompatibel. Slim 12K Pods passen nur in die Slim 12K. Im Zweifel hilft der WhatsApp Support.</p>
                </div>
                <div class="col-12 col-lg-8">
                    <div class="mb-table">
                        <table>
                            <thead><tr><th scope="col">Pod</th><th scope="col">GT 22000</th><th scope="col">GT Max / GT 15000</th><th scope="col">Slim 12K</th></tr></thead>
                            <tbody>
                                <tr><th scope="row">GT 22000 Pod</th><td class="y">&#10003;<span class="mb-pass"> passt</span></td><td class="y">&#10003;<span class="mb-pass"> passt</span></td><td class="n">&ndash;</td></tr>
                                <tr><th scope="row">GT Max Pod</th><td class="y">&#10003;<span class="mb-pass"> passt</span></td><td class="y">&#10003;<span class="mb-pass"> passt</span></td><td class="n">&ndash;</td></tr>
                                <tr><th scope="row">Slim 12K Pod + Coil</th><td class="n">&ndash;</td><td class="n">&ndash;</td><td class="y">&#10003;<span class="mb-pass"> passt</span></td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    {* ---------- SO FUNKTIONIERT'S ---------- *}
    <section class="mb-sec mb-sec--light">
        <div class="container">
            <div class="mb-kicker">04 · So funktioniert's</div>
            <h2 class="mb-h2">Mehrweg statt Einweg.</h2>
            <ol class="mb-steps">
                <li><span>1</span><h3>Akkuträger wählen</h3><p>GT 22000, GT Max oder Slim 12K. Einmal kaufen, per USB-C laden und immer wieder nutzen.</p></li>
                <li><span>2</span><h3>Pod einsetzen</h3><p>Vorbefüllt und sofort startklar. Kein Nachfüllen nötig.</p></li>
                <li><span>3</span><h3>Sorte wechseln</h3><p>Leeren Pod abziehen und den nächsten einsetzen. Der Akkuträger bleibt.</p></li>
            </ol>
        </div>
    </section>

    {* ---------- FAQ ---------- *}
    <section class="mb-sec mb-sec--white">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-4 mb-3 mb-lg-4">
                    <div class="mb-kicker">05 · FAQ</div>
                    <h2 class="mb-h2">Häufige Fragen zu Megabar</h2>
                    <p class="mb-lead d-none d-lg-block">Deine Frage ist nicht dabei? Schreib uns.</p>
                    <a class="btn btn-primary d-none d-lg-inline-block" style="border-radius:2rem" href="https://wa.me/4924029791380">WhatsApp Support</a>
                </div>
                <div class="col-12 col-lg-8 mb-faq">
                    {foreach $mbFaq as $q}
                        <details{if $q@first} open{/if}><summary>{$q[0]}</summary><p>{$q[1]}</p></details>
                    {/foreach}
                    <p class="d-lg-none mt-3 mb-0">Deine Frage ist nicht dabei? <a class="btn btn-primary btn-sm ml-1" style="border-radius:2rem" href="https://wa.me/4924029791380">WhatsApp Support</a></p>
                </div>
            </div>
        </div>
    </section>

    {* ---------- SEO-TEXT ---------- *}
    <section class="mb-sec mb-sec--light">
        <div class="container">
            <h2 class="mb-h2">Megabar Pods und Akkuträger im offiziellen Shop</h2>
            <div class="mb-seo">
                <p>Megabar ist ein wiederaufladbares Pod-System: Ein Akkuträger wird mit vorbefüllten Wechselpods kombiniert. Statt nach jedem Liquid ein ganzes Gerät zu entsorgen, wird nur der Pod getauscht.</p>
                <p>Der GT 22000 ist auf bis zu 22.000 Züge ausgelegt und bietet die größte Sortenauswahl. Der GT Max 15000 kommt mit 1400-mAh-Akku und einstellbarer Airflow, die Slim 12K ist die kompakte Variante mit 600-mAh-Akku und 6-ml-Pods.</p>
            </div>
        </div>
    </section>

    {opcMountPoint id='mb_home_bottom' inContainer=false}

    <div class="mb-warning">Dieses Produkt enthält Nikotin, einen Stoff, der sehr stark abhängig macht. Es wird nicht für die Verwendung durch Nichtraucher empfohlen.</div>

    <script type="application/ld+json">{ldelim}"@context":"https://schema.org","@type":"FAQPage","mainEntity":[{foreach $mbFaq as $q}{ldelim}"@type":"Question","name":{$q[0]|json_encode},"acceptedAnswer":{ldelim}"@type":"Answer","text":{$q[1]|json_encode}{rdelim}{rdelim}{if !$q@last},{/if}{/foreach}]{rdelim}</script>

{literal}<script>
/* Geschmacks-Filter: ordnet jede Sorte anhand ihres Namens Gruppen zu (mehrere moeglich).
   Neue Sorten werden automatisch einsortiert. Gruppen ohne Sorte werden nicht angezeigt. */
(function () {
    var groups = [
        ['Ice', /\b(ice|mint|menthol|cool|cold|frost)\b/i],
        ['Beere', /(berr|cherry|cranberr|acai|raspberr|strawberr|blackberr|blueberr|grape)/i],
        ['Getränke', /(lemonade|cola|\btea\b|energy|mojito|soda|juice|drink)/i],
        ['Dessert', /(vanilla|cream|custard|cake|cookie|caramel|dessert|candy|gum|bubble)/i],
        ['Frucht', /(apple|peach|melon|kiwi|mango|pineapple|lemon|lime|fig|dragonfruit|coconut|guava|passion|lychee|banana|orange|cactus|grape|fruit|cherry|berr)/i]
    ];
    var box = document.getElementById('mb-chips');
    var items = document.querySelectorAll('#mb-sorten [data-mb-name]');
    if (!box || !items.length) { return; }
    var grid = document.querySelector('#mb-sorten .mb-collapsed');
    var more = document.getElementById('mb-showmore');
    function expand() { if (grid) { grid.classList.remove('mb-collapsed'); } if (more) { more.remove(); more = null; } }
    if (more) { more.addEventListener('click', expand); }
    var counts = {};
    items.forEach(function (el) {
        var name = (el.getAttribute('data-mb-name') || '').split(' - ').pop();
        var found = [];
        groups.forEach(function (g) { if (g[1].test(name)) { found.push(g[0]); } });
        el.setAttribute('data-mb-groups', '|' + found.join('|') + '|');
        found.forEach(function (g) { counts[g] = (counts[g] || 0) + 1; });
    });
    var chips = [['Alle', items.length]];
    groups.forEach(function (g) { if (counts[g[0]]) { chips.push([g[0], counts[g[0]]]); } });
    if (chips.length < 3) { return; }
    chips.forEach(function (c, i) {
        var b = document.createElement('button');
        b.type = 'button';
        b.className = 'mb-chip' + (i === 0 ? ' is-active' : '');
        b.setAttribute('aria-pressed', i === 0 ? 'true' : 'false');
        b.innerHTML = c[0] + '<small>' + c[1] + '</small>';
        b.addEventListener('click', function () {
            expand();
            box.querySelectorAll('.mb-chip').forEach(function (x) {
                x.classList.toggle('is-active', x === b);
                x.setAttribute('aria-pressed', x === b ? 'true' : 'false');
            });
            items.forEach(function (el) {
                el.hidden = !(i === 0 || el.getAttribute('data-mb-groups').indexOf('|' + c[0] + '|') !== -1);
            });
        });
        box.appendChild(b);
    });
})();
</script>{/literal}
</div>
