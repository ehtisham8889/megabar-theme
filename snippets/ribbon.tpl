{block name='snippets-ribbon'}
    
    {if !empty($Artikel->Preise->Sonderpreis_aktiv)}
        {$sale = $Artikel->Preise->discountPercentage}
    {/if}

    {foreach $Artikel->oMerkmale_arr as $ribbonChar}
        {if $ribbonChar->getName()|strstr:"Nikotinstärke"}
            
            {foreach $ribbonChar->getCharacteristicValues() as $ribbonCharV}
                {assign var="nikotinRibbon" value="{$ribbonCharV->getValue()|escape:'html'}"}
            {/foreach}
        {/if}
        
    {/foreach}

    {if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2C"}
        {block name='snippets-ribbon-main'}
            
            {if $Artikel->nErscheinendesProdukt}
                <div class="ribbon
                            ribbon-{$Artikel->oSuchspecialBild->getType()} productbox-ribbon preorder">
                                <span>{lang key="preorder-ribbon" section="custom"}</span>
                            </div>
            {else}
                {if isset($Artikel->oSuchspecialBild)}
                    {if $Artikel->oSuchspecialBild->getType() === $smarty.const.SEARCHSPECIALS_CUSTOMBADGE}
                        {assign var=customBadge value=$Artikel->oSuchspecialBild->getCssAndText()}
                        <div class="ribbon ribbon-custom productbox-ribbon{if $customBadge->class !== ''}{$customBadge->class}{/if}"
                            {if $customBadge->style !== ''} style="{$customBadge->style}"{/if}>
                            <span>{$customBadge->text}</span>
                        </div>
                    {else}
                        {if empty($nikotinRibbon)} {*default behavior*}
                            <div class="ribbon
                            ribbon-{$Artikel->oSuchspecialBild->getType()} productbox-ribbon">
                                <span>{lang key='ribbon-'|cat:$Artikel->oSuchspecialBild->getType() section='productOverview' printf=$sale|default:''|cat:'%'}</span>
                            </div>
                        {else} {* default ribbon AND nikotin badge *}
                            <div class="ribbon-wrap productbox-ribbon ribbon">
                                <div class="position-relative ribbon
                                ribbon-{$Artikel->oSuchspecialBild->getType()} productbox-ribbon ribbon-with-nikotin">
                                    <span>{$nikotinRibbon}</span>
                                </div>
                                <div class="position-relative ribbon
                                ribbon-{$Artikel->oSuchspecialBild->getType()} productbox-ribbon ribbon-with-nikotin">
                                    <span>{lang key='ribbon-'|cat:$Artikel->oSuchspecialBild->getType() section='productOverview' printf=$sale|default:''|cat:'%'}</span>
                                </div>
                            </div>
                        {/if}
                    {/if}
                {elseif !empty($nikotinRibbon)} {* only nikotin badge *}
                        <div class="ribbon
                        ribbon-nikotin productbox-ribbon">
                            <span>{$nikotinRibbon}</span>
                        </div>
                {/if}
            {/if}
        {/block}
    {else}
        {block name='snippets-ribbon-main'}
        
       {if $Artikel->nErscheinendesProdukt}
            <div class="ribbon
                        ribbon-{$Artikel->oSuchspecialBild->getType()} productbox-ribbon preorder">
                            <span>{lang key="preorder-ribbon" section="custom"}</span>
                        </div>
        {else}
            {if isset($Artikel->oSuchspecialBild)}
                {if $Artikel->oSuchspecialBild->getType() === $smarty.const.SEARCHSPECIALS_CUSTOMBADGE}
                    {assign var=customBadge value=$Artikel->oSuchspecialBild->getCssAndText()}
                    <div class="ribbon ribbon-custom productbox-ribbon{if $customBadge->class !== ''}{$customBadge->class}{/if}"
                        {if $customBadge->style !== ''} style="{$customBadge->style}"{/if}>
                        <span>{$customBadge->text}</span>
                    </div>
                {else}
                    {if empty($nikotinRibbon)} {*default behavior*}
                        <div class="ribbon
                        ribbon-{$Artikel->oSuchspecialBild->getType()} productbox-ribbon">
                            <span>{lang key='ribbon-'|cat:$Artikel->oSuchspecialBild->getType() section='productOverview' printf=$sale|default:''|cat:'%'}</span>
                        </div>
                    {else} {* default ribbon AND nikotin badge *}
                        <div class="ribbon-wrap productbox-ribbon ribbon">
                            <div class="position-relative ribbon
                            ribbon-{$Artikel->oSuchspecialBild->getType()} productbox-ribbon ribbon-with-nikotin">
                                <span>{$nikotinRibbon}</span>
                            </div>
                            <div class="position-relative ribbon
                            ribbon-{$Artikel->oSuchspecialBild->getType()} productbox-ribbon ribbon-with-nikotin">
                                <span>{lang key='ribbon-'|cat:$Artikel->oSuchspecialBild->getType() section='productOverview' printf=$sale|default:''|cat:'%'}</span>
                            </div>
                        </div>
                    {/if}
                {/if}
            {elseif !empty($nikotinRibbon)} {* only nikotin badge *}
                    <div class="ribbon
                    ribbon-nikotin productbox-ribbon">
                        <span>{$nikotinRibbon}</span>
                    </div>
            {/if}
        {/if}
    {/block}
    {/if}
    
{/block}
