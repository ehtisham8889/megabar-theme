{* goe 19062024 - Trefferanzahl auf Kundenwunsch entfernt *}
{block name='snippets-filter-genericFilterItem-nav-main'}
	{link class="filter-item {if $filterIsActive === true}active{/if}"
		href="{if $filterOption->isActive()}{$filter->getUnsetFilterURL($filterOption->getValue())}{else}{$filterOption->getURL()}{/if}"
		rel="nofollow"}
		<div class="box-link-wrapper">
			{if $filter->getIcon() !== null}
				<i class="fa {$filter->getIcon()} snippets-filter-item-icon-right"></i>
			{else}
				<i class="far fa-{if $filterIsActive === true}check-{/if}square snippets-filter-item-icon-right"></i>
			{/if}
			{if $filter->getNiceName() === 'Rating'}
				{block name='snippets-filter-genericFilterItem-include-rating-nav'}
					<span class="snippets-filter-item-icon-right">{include file='productdetails/rating.tpl' stars=$filterOption->getValue()}</span>
				{/block}
			{/if}
			<span class="word-break">{$filterOption->getName()}</span>
			{*{badge variant="outline-secondary"}{$filterOption->getCount()}{/badge}*}
		</div>
	{/link}
{/block}