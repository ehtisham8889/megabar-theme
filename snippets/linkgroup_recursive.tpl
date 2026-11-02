
{block name='snippets-linkgroup-recursive-has-not-items'}
    <li>
        <span class="smokelink" data-href="{$li->getURL()}" data-target="{$li->getTarget()}">
            <span class="text-truncate d-block">
                {$li->getName()}
            </span>
        </span> 
    </li>
{/block}
                       
{block name='snippets-linkgroup-recursive-mega-child-header'}
    <li class="nav-item d-lg-none">
        <span class="smokelink" data-href="{$mainLink->getURL()}" data-target="{$mainLink->getTarget()}">
            <strong class="nav-mobile-heading">
                {lang key='menuShow' printf=$mainLink->getName()}
            </strong>
        </span>
    </li>
{/block}
                                   
{block name='snippets-linkgroup-recursive-mega-child-link-no-child'}
    <span class="smokelink" data-href="{$link->getURL()}" data-target="{$link->getTarget()}">
        <span class="text-truncate d-block">
            {$link->getName()}
        </span>
    </span> 
{/block}
                                            