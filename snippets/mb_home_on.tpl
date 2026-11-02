{* Megabar: gibt "1" aus, wenn auf dieser Seite die neue Startseite (page/megabar_home.tpl) gezeigt wird.
   Template-Einstellung "Neue Startseite": off = nie, preview = nur mit ?mbnew=1 in der URL, on = fuer alle.
   Aufruf: {include file='snippets/mb_home_on.tpl' assign='mbHomeOn'} *}{strip}
{if isset($nSeitenTyp) && $nSeitenTyp === $smarty.const.PAGE_STARTSEITE}
    {$mbHomeMode = $Einstellungen.template.megabarhome.mbhome|default:'preview'}
    {if $mbHomeMode === 'on' || ($mbHomeMode === 'preview' && isset($smarty.get.mbnew))}1{/if}
{/if}
{/strip}