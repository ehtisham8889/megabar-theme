{* Anpassung wg xvolution warenkorb workflows und Anzeige der Anzahl  *}
{block name='basket-cart-items-product-link'}
	{if $oPosition->nPosTyp === $smarty.const.C_WARENKORBPOS_TYP_GRATISGESCHENK}
		{link class="cart-items-name" href=$oPosition->Artikel->cURLFull title=$posName}{$oPosition->nAnzahl|replace_delim} x {$oPosition->cName|trans}{/link}
	{else}
		{link class="cart-items-name" href=$oPosition->Artikel->cURLFull title=$posName}{$oPosition->cName|trans}{/link}
	{/if}
{/block}

{if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
	{block name='basket-cart-items-product-data-short-desc'}
	{/block}

	{block name='basket-cart-items-product-data-attributes-attributes'}
	{/block}
{/if}