{block name='productdetails-attributes-shop-attributes'}
    {foreach $Artikel->Attribute as $Attribut}
        {if $Attribut->cName|lower|strstr:"gebinde"}
        {else}
        <tr class="attr-custom">
            <td class="h6">{$Attribut->cName}: </td>
            <td class="attr-value">{$Attribut->cWert}</td>
        </tr>
        {/if}
    {/foreach}
    {if !empty($Artikel->FunktionsAttribute["gpsr_manufacturer_name"])}
    <tr>
        {if !$isMobile}<td class="h6 w-auto">{lang key="GPSRManufacturerLabel" section="custom"}:</td>{/if}
        <td class="gpsr-table" {if $isMobile}colspan="2"{/if}>
            {if $isMobile}
                <b class="text-uppercase">{lang key="GPSRManufacturerLabel" section="custom"}:</b><br><br>
            {/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_manufacturer_name"])}{$Artikel->FunktionsAttribute["gpsr_manufacturer_name"]}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_manufacturer_street"])}{$Artikel->FunktionsAttribute["gpsr_manufacturer_street"]}{if !empty({$Artikel->FunktionsAttribute["gpsr_manufacturer_housenumber"]})} {$Artikel->FunktionsAttribute["gpsr_manufacturer_housenumber"]}{/if}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_manufacturer_postalcode"])}{$Artikel->FunktionsAttribute["gpsr_manufacturer_postalcode"]}{if !empty({$Artikel->FunktionsAttribute["gpsr_manufacturer_city"]})} {$Artikel->FunktionsAttribute["gpsr_manufacturer_city"]}{/if}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_manufacturer_state"])}{$Artikel->FunktionsAttribute["gpsr_manufacturer_state"]}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_manufacturer_country"])}{$Artikel->FunktionsAttribute["gpsr_manufacturer_country"]}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_manufacturer_email"])}{$Artikel->FunktionsAttribute["gpsr_manufacturer_email"]}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_manufacturer_homepage"])}{$Artikel->FunktionsAttribute["gpsr_manufacturer_homepage"]}{/if}
        </td>
    </tr>
    {/if}
    {if !empty($Artikel->FunktionsAttribute["gpsr_responsibleperson_name"])}
    <tr>
    {if !$isMobile}<td class="h6 w-auto">{lang key="GPSRRespPersonLabel" section="custom"}:</td>{/if}
        <td class="gpsr-table" {if $isMobile}colspan="2"{/if}>
            {if $isMobile}
                <b class="text-uppercase">{lang key="GPSRRespPersonLabel" section="custom"}:</b><br><br>
            {/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_responsibleperson_name"])}{$Artikel->FunktionsAttribute["gpsr_responsibleperson_name"]}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_responsibleperson_street"])}{$Artikel->FunktionsAttribute["gpsr_responsibleperson_street"]}{if !empty({$Artikel->FunktionsAttribute["gpsr_responsibleperson_housenumber"]})} {$Artikel->FunktionsAttribute["gpsr_responsibleperson_housenumber"]}{/if}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_responsibleperson_postalcode"])}{$Artikel->FunktionsAttribute["gpsr_responsibleperson_postalcode"]}{if !empty({$Artikel->FunktionsAttribute["gpsr_responsibleperson_city"]})} {$Artikel->FunktionsAttribute["gpsr_responsibleperson_city"]}{/if}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_responsibleperson_state"])}{$Artikel->FunktionsAttribute["gpsr_responsibleperson_state"]}<br>{/if} 
            {if !empty($Artikel->FunktionsAttribute["gpsr_responsibleperson_country"])}{$Artikel->FunktionsAttribute["gpsr_responsibleperson_country"]}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_responsibleperson_email"])}{$Artikel->FunktionsAttribute["gpsr_responsibleperson_email"]}<br>{/if}
            {if !empty($Artikel->FunktionsAttribute["gpsr_responsibleperson_homepage"])}{$Artikel->FunktionsAttribute["gpsr_responsibleperson_homepage"]}{/if}
        </td>
    </tr>
    {/if}
{/block}

{block name='productdetails-attributes-table' append}
    {if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2C" && $Einstellungen.template.smokegeneralsettings.smokeshowdanger == "Y"}
        {block name='goe_hazards'}
            {if isset($gefahrenOutputAmArtikel) && !empty($gefahrenOutputAmArtikel)}
                <p class="h3 mt-6">{lang key="goeHazardHeadline" section="custom"}</p>
                <table class="goehaztab table table-sm table-striped table-bordered-outline">
                {foreach $gefahrenOutputAmArtikel as $ghaz => $ghzv}
                    <tr>
                        <td class="h6 text-primary">{$ghaz}:</td>
                        <td class="attr-characteristic">{$ghzv}</td>
                    </tr>
                {/foreach}
                </table>
            {/if}
        {/block}
    {/if}
{/block}
