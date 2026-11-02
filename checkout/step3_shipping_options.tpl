{block name='checkout-step3-shipping-options-legend-shipping-options'}
    <div class="d-block d-lg-flex">
        <div class="h2">{lang key='shippingOptions'}</div>
        <div class="btnwrap pl-3">
            <div class="checkout-shipping-form-change mb-0 pb-0">
            {lang key='shippingTo' section='checkout'}: {$Lieferadresse->cStrasse} {$Lieferadresse->cHausnummer}, {$Lieferadresse->cPLZ} {$Lieferadresse->cOrt}, {$Lieferadresse->cLand}
            {button href="{get_static_route id='bestellvorgang.php'}?editLieferadresse=1"
                variant="link"
                size="sm"
                class="badge-primary font-size-sm"
            }
                <span class="text-decoration-underline">{lang key='change'}</span>
                <span class="checkout-shipping-form-change-icon fa fa-pencil-alt"></span>
            {/button}
        </div>
        </div>
    </div>
{/block}
{block name='checkout-step3-shipping-options-shipping-address-link'}
    
{/block}
{block name='checkout-step3-shipping-options-shipping-address-hr'}
    <hr class="mt-0">
{/block}