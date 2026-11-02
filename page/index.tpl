{* Megabar: neue Startseite (page/megabar_home.tpl), wenn eingeschaltet. Sonst unveraendert die NOVA-Startseite.
   Die neue Startseite liegt in einer eigenen Datei, die nur bei Bedarf geladen wird. *}
{block name='page-index'}
    {include file='snippets/mb_home_on.tpl' assign='mbHomeOn'}
    {if $mbHomeOn}
        {include file='page/megabar_home.tpl'}
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
