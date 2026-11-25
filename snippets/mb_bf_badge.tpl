{* Megabar: Black Week badge, used in productlist/item_box.tpl and productdetails/image.tpl.
   Shows on products with an active Sonderpreis, but not on products that are out of stock
   (shop shows "Ausverkauft") or not released yet. To switch the badge off everywhere, empty this file. *}
{$mbBfSoldOut = false}
{if isset($Artikel->oSuchspecialBild) && $Artikel->oSuchspecialBild->getType() == 7}{* 7 = SEARCHSPECIALS_OUTOFSTOCK, "Ausverkauft" *}
    {$mbBfSoldOut = true}
{/if}
{if empty($Artikel->nIstVater) && $Artikel->fLagerbestand <= 0
    && $Artikel->cLagerBeachten === 'Y' && $Artikel->cLagerKleinerNull !== 'Y'}
    {$mbBfSoldOut = true}
{/if}
{if !empty($Artikel->Preise->Sonderpreis_aktiv) && !$mbBfSoldOut && empty($Artikel->nErscheinendesProdukt)}
    <div class="black-friday-badge position-absolute">
        <img src="/templates/Megabar/themes/smoke2u/gfx/black-week-badge.png" alt="Black Friday Angebot für {$Artikel->cName}">
    </div>
{/if}
