{* Megabar SEO: schema.org availability fuer das Offer in Produktboxen (Listen, Startseite, Slider).
   Gleiche Logik wie NOVA productdetails/stock.tpl (Block productdetails-stock-rich-availability),
   damit Boxen und Artikeldetailseite denselben Status melden. *}
{if $Artikel->nErscheinendesProdukt && $Artikel->Erscheinungsdatum_de !== '00.00.0000' && $Einstellungen.global.global_erscheinende_kaeuflich === 'Y'}
    <link itemprop="availability" href="https://schema.org/PreOrder" />
{elseif $Artikel->cLagerBeachten === 'N' || $Artikel->fLagerbestand > 0 || $Artikel->cLagerKleinerNull === 'Y'}
    <link itemprop="availability" href="https://schema.org/InStock" />
{else}
    <link itemprop="availability" href="https://schema.org/OutOfStock" />
{/if}
