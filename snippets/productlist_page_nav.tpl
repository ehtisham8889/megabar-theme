
	{block name='snippets-productlist-page-nav'}
		{if $Suchergebnisse->getProductCount() > 0}
			{opcMountPoint id='opc_before_page_nav_'|cat:$navid}

			{if $hrTop|default:false === true}
				{block name='snippets-productlist-page-nav-hr-top'}
					{if $navid !== "header"}
						
					{/if}
				{/block}
			{/if}
			
				{if count($NaviFilter->getSearchResults()->getProducts()) > 0 && $navid === 'header'}
					{block name='snippets-productlist-page-nav-result-options-sort'}

							{block name='snippets-productlist-page-nav-include-result-options'}
								{if count($Suchergebnisse->getProducts()) > 0}
									{opcMountPoint id='opc_before_result_options'}
								{/if}
								{$filterPlacement='collapse'}
								{if $isMobile && !$isTablet}
									{$filterPlacement="collapse"}
								{elseif $isTablet || $Einstellungen.template.productlist.filter_placement === 'modal'}
									{$filterPlacement="collapse"}
								{/if}

								<div id="improve_search" class="{if $isMobile}col-6{else}col-12{/if} {if $boxesLeftActive}{else}col-md-8{/if} {if $isMobile}col-lg-10{else}{if $boxesLeftActive}{else}col-lg-8{/if}{/if} result-option-wrapper {if $filterPlacement !== 'collapse'}d-inline-block btn-group{/if} {if $filterPlacement === ''}d-lg-none{/if}">
									{include file='productlist/result_options.tpl'
										itemCount=$Suchergebnisse->getProductCount()
										filterPlacement="collapse"}
										 
								</div>
							{/block}
							{if !$isMobile} 
								{block name='snippets-productlist-page-nav-actions'}
									{block name='snippets-productlist-page-nav-actions-sort'}
										{if count($Suchergebnisse->getSortingOptions()) > 0}
										<div class="col-12 {if $boxesLeftActive}col-md-6 order-3 {else}col-md-2{/if} text-right">
											{dropdown class="filter-type-FilterItemSort btn-group" variant="outline-secondary" text="<span class='text-primary icon-smi-sorting fa-lg snippets-filter-item-icon-left'></span>{lang key='customSort' section='custom'}"}
												{foreach $Suchergebnisse->getSortingOptions() as $option}
													{dropdownitem rel="nofollow" href=$option->getURL() class="page-nav-filter-item" active=$option->isActive()}
														{$option->getName()} 
													{/dropdownitem}
												{/foreach}
											{/dropdown}
										</div>
										{/if}
									{/block}
									{block name='snippets-productlist-page-nav-actions-items'}
										{if count($Suchergebnisse->getLimitOptions()) > 0}
										{dropdown class="filter-type-FilterItemLimits btn-group" variant="outline-secondary" text="{lang key='productsPerPage' section='productOverview'}"}
											{foreach $Suchergebnisse->getLimitOptions() as $option}
											
												{dropdownitem rel="nofollow" href=$option->getURL() class="page-nav-filter-item" active=$option->isActive()}
													{$option->getName()} 
												{/dropdownitem}
											{/foreach}
										{/dropdown}
										{/if}
									{/block}
									{*if !$isMobile}
										{block name='snippets-productlist-page-nav-include-layout-options'}
											{include file='productlist/layout_options.tpl'}
										{/block}
									{/if*}
								{/block}
							{/if}
					
					{/block}
				{/if}
				{if $navid === "header"}
				{else}
					{container}
						{row class="productlist-page-nav no-gutters text-center justify-content-center pagenav-bottom"}
							{col cols=auto class="productlist-item-info  ml-0 {if $Suchergebnisse->getPages()->getMaxPage() > 1}productlist-item-border{/if}"}
								{block name='snippets-productlist-page-nav-current-page-count'}
							
									{lang key="products"} {$Suchergebnisse->getOffsetStart()} - {$Suchergebnisse->getOffsetEnd()} {lang key='of' section='productOverview'} {$Suchergebnisse->getProductCount()}
							
								{/block}
							{/col}
								{if $Suchergebnisse->getPages()->getMaxPage() > 1 && !($isMobile && $navid === 'header')}
									{block name='snippets-productlist-page-nav-page-nav'}
										{if $navid === "header"}
										{else}
											{col cols=12 md=auto class="productlist-pagination"}
												<nav class="navbar-pagination" aria-label="Productlist Navigation" data-nav-id="{$navid}">
													<ul class="pagination">
														{block name='snippets-productlist-page-nav-first-page'}
															<li class="page-item{if $Suchergebnisse->getPages()->getCurrentPage() == 1} disabled{/if}">
																{* _s1 soll auf Hauptseite verlinken *}
																{if $filterPagination->getPrev()->getURL()|substr:-3:3 == "_s1"}
																	<a href="{$filterPagination->getPrev()->getURL()|replace:'_s1':''}" class="page-link js-pagination-ajax" aria-label="{lang key='previous' section='productOverview'}">
																		<i class="fas fa-long-arrow-alt-left"></i>
																	</a>
																{else}
																	<a href="{$filterPagination->getPrev()->getURL()}" class="page-link js-pagination-ajax" aria-label="{lang key='previous' section='productOverview'}">
																		<i class="fas fa-long-arrow-alt-left"></i>
																	</a>
																{/if}
															</li>
														{/block}
														<li class="page-item dropdown">
															{block name='snippets-productlist-page-nav-button'}
																<button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																	<span class="pagination-site">{lang key='page'}</span> {$Suchergebnisse->getPages()->getCurrentPage()}
																</button>
															{/block}
															<div class="dropdown-menu shadow-none">
																{block name='snippets-productlist-page-nav-pages'}
																	{foreach $filterPagination->getPages() as $page}
																		<div class="dropdown-item page-item{if $page->isActive()} active{/if}">
																			{* _s1 soll auf Hauptseite verlinken *}
																			{if ($page->getURL()|substr:-3:3 == "_s1")}
																				{link class="page-link js-pagination-ajax" href=$page->getURL()|replace:'_s1':''}
																					<span class="pagination-site">{lang key='page'}</span> {$page->getPageNumber()}
																				{/link}
																			{else}
																				{link class="page-link js-pagination-ajax" href=$page->getURL()}
																					<span class="pagination-site">{lang key='page'}</span> {$page->getPageNumber()}
																				{/link}
																			{/if}
																		</div>
																	{/foreach}
																{/block}
															</div>
														</li>
														{block name='snippets-productlist-page-nav-last-page'}
															<li class="page-item{if $Suchergebnisse->getPages()->getCurrentPage() == $Suchergebnisse->getPages()->getMaxPage()} disabled{/if}">
																{link class="page-link js-pagination-ajax" href=$filterPagination->getNext()->getURL() aria=['label' => {lang key='next' section='productOverview'}]}<i class="fas fa-long-arrow-alt-right"></i>{/link}
															</li>
														{/block}
													</ul>
												</nav>
											{/col}
										{/if}
									{/block}
								{/if}
							
						{/row}
					{/container}
				{/if}
			{block name='snippets-productlist-page-nav-hr-bottom'}
				{if $navid !== "header"}
				
				{/if}
			{/block}

			
		{/if}
	{/block}
