{* goe 19062024 - Trefferanzahl auf Kundenwunsch entfernt *}
{block name='snippets-filter-manufacturer-item-image-text'}
	{image lazy=true webp=true
		alt=$filterOption->getName()|escape:'html'
		src=$filterOption->getData('cBildpfadKlein')
		class="vmiddle filter-img"
	}
	<span class="word-break filter-item-value">{$filterOption->getName()}</span>
		{*{badge variant="outline-secondary"}{$filterOption->getCount()}{/badge}*}
{/block}

{block name='snippets-filter-manufacturer-item-text'}
	<i class="far fa-{if $filterIsActive === true}check-{/if}square snippets-filter-item-icon-right"></i>
	<span class="word-break filter-item-value">{$filterOption->getName()}</span>
	{*{badge variant="outline-secondary"}{$filterOption->getCount()}{/badge}*}
{/block}
