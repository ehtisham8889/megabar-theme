{assign var=goe_available_filters value=False}
{if $show_filters}
	{if count($NaviFilter->getAvailableContentFilters()) > 0}
		{foreach $NaviFilter->getAvailableContentFilters() as $filter}
			{if count($filter->getFilterCollection()) > 0 || $filter->getOptions()|count > 0}
				{$goe_available_filters = True}
			{/if}
		{/foreach}
	{/if}
{/if}
{if $goe_available_filters}
	
	<div class="productlist-filter-wrap dropdowns {if $boxesLeftActive}row pl-3{/if}">
	 	{if $boxesLeftActive}			
			{assign var="filterSizeClass" value="smaller"}
		{else}
			{assign var="filterSizeClass" value="ncfst"}
			{}
		{/if}
		{if $show_filters}
			{if count($NaviFilter->getAvailableContentFilters()) > 0}
				{foreach $NaviFilter->getAvailableContentFilters() as $filter}
					{if count($filter->getFilterCollection()) > 0}
						{foreach $filter->getOptions() as $subFilter}
							{if $subFilter->getVisibility() !== \JTL\Filter\Visibility::SHOW_NEVER
							&& $subFilter->getVisibility() !== \JTL\Filter\Visibility::SHOW_BOX
							&& $filter->getOptions()|count > 0}
							<div class="form-group dropdown filter-type-dropdown {$filterSizeClass} {if $boxesLeftActive}col-6 col-md-4 col-lg-3{/if}">
								{dropdown variant="outline-secondary" text="{$subFilter->getFrontendName()}"}
									{if ($subFilter->getData('cTyp') === 'SELECTBOX') && $subFilter->getOptions()|@count > 0}
										{dropdown variant="outline-secondary" text="{lang key='selectFilter' section='global'} " toggle-class="btn-block"}
											{include file='snippets/filter/characteristic.tpl' Merkmal=$subFilter sub=true}
										{/dropdown}
									{else}
										{include file='snippets/filter/characteristic.tpl' Merkmal=$subFilter sub=true}
									{/if}
								{/dropdown}
							</div>
							{/if}
						{/foreach}
					{elseif $filter->getOptions()|count > 0}
						<div class="form-group dropdown filter-type-dropdown {$filterSizeClass} {if $filter->getClassName() === "JTL\Filter\Items\PriceRange"}js-price-range-box{/if} {if $boxesLeftActive}col-6 col-md-4 col-lg-3{/if}">
							{if $filter->getClassName() === "JTL\Filter\Items\PriceRange"}
								
									{dropdown variant="outline-secondary" text="{$filter->getFrontendName()}"}
										{input data=['id'=>'js-price-range-url'] type="hidden" value="{$NaviFilter->getFilterURL()->getURL()}"}
										{include file='snippets/filter/price_slider.tpl' id='price-slider-content'}
									{/dropdown}
								
							{elseif $filter->getClassName() === "JTL\Filter\Items\Search"}
								
									{dropdown variant="outline-secondary" text="{$filter->getFrontendName()}"}
										{include file='snippets/filter/search.tpl'}
									{/dropdown}
								
							{elseif $filter->getClassName() === "JTL\Filter\Items\Manufacturer"}
								
									{dropdown variant="outline-secondary" text="{$filter->getFrontendName()}"}
										{include file='snippets/filter/manufacturer.tpl'}
									{/dropdown}
								
							{elseif $filter->getOptions()|count > 0}
								
									{dropdown variant="outline-secondary" text="{$filter->getFrontendName()}"}
										{include file='snippets/filter/genericFilterItem.tpl' filter=$filter}
									{/dropdown}
								
							{/if}
						</div>
					{/if}
				{/foreach}
				
			{/if}
		{/if}
		<div class="goe-active-filters">
			{include file='snippets/filter/active_filter.tpl'}
		</div>
		
	</div>
{/if}
