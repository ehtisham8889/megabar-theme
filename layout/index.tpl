{assign var="renderPage" value="N"}
{if JTL\Session\Frontend::getCustomer()->getID() === 0 && $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}

    {if isset($Einstellungen.template.smokegeneralsettings.excl) && !empty($Einstellungen.template.smokegeneralsettings.excl) && isset($Link) && isset($Link->id)}
            {assign var="pageID" value="{$Link->id}"}
            {assign var="exclArr" value=","|explode:$Einstellungen.template.smokegeneralsettings.excl|replace:" ":""}
            
            {if isset($exclArr) && !empty($exclArr)}
                {if $pageID|@in_array:$exclArr}
                   {* this page should be rendered without need to be logged in *}
                   {assign var="renderPage" value="Y"}
                {/if}
            {/if}
        {/if}
    {if $renderPage === "N"}    
        {block name='layout-index'}
            {*not logged in *}
            {include file='layout/header.tpl' hLogin="ja"}
            {include file='snippets/b2b_login.tpl'}
        {/block}
    {/if}
{/if}

{if $renderPage === "Y"} {* hiding footer to prevent farming deeplinks *}
    {block name='layout-index-include-footer'}
    {/block}
{/if} 

{if $Link->getLinkType() === $smarty.const.LINKTYP_ONLINE_WRB_FORMULAR}
{block name='layout-index-content' append}
    {block name='layout-index-link-type-online-revocation-form'}
                        <div id="online-revocation-form" class="well well-sm">
                            {opcMountPoint id='opc_before_revocation_form' inContainer=false}
                            {container fluid=$Link->getIsFluid() class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
                            {include file='snippets/withdrawal_form.tpl'}
                                {if isset($WRB) && $WRB !== false}
                                    <hr class="my-4">
                                    {if $AGB->cAGBContentHtml}
                                        {$AGB->cAGBContentHtml}
                                    {elseif $AGB->cAGBContentText}
                                        {$AGB->cAGBContentText|nl2br}
                                    {/if}
                                    {if $WRB->cWRBContentHtml}
                                        {$WRB->cWRBContentHtml}
                                    {elseif $WRB->cWRBContentText}
                                        {$WRB->cWRBContentText|nl2br}
                                    {/if}
                                {/if}
                            {/container}
                            {opcMountPoint id='opc_after_revocation_form' inContainer=false}
                        </div>
                    {/block}
{/block}
{/if}


