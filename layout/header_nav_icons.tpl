{block name='layout-header-nav-icons-include-header-nav-search'}
    {if $Einstellungen.template.header.menu_single_row !== 'Y' && !$isMobile}
        {include file='layout/header_nav_search.tpl' tag='li'}
    {/if}
{/block}