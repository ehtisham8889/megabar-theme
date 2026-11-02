{block name='checkout-inc-billing-address-form-custom-field'}
    {assign var="kKundenfeld" value=$oKundenfeld->getID()}
    {if isset($customerAttributes[$kKundenfeld])}
        {assign var="cKundenattributWert" value=$customerAttributes[$kKundenfeld]->getValue()}
        {assign var="isKundenattributEditable" value=$customerAttributes[$kKundenfeld]->isEditable()}
    {else}
        {assign var="cKundenattributWert" value=''}
        {assign var="isKundenattributEditable" value=true}
    {/if}
    {if $oKundenfeld->getLabel()|strstr:"Rechnung"}<h3>{$oKundenfeld->getLabel()}</h3>{/if}
    {formgroup class="{if isset($fehlendeAngaben.custom[$kKundenfeld])} has-error{/if} {if $oKundenfeld->getType() === \JTL\Customer\CustomerField::TYPE_NUMBER}exclude-from-label-slide{/if}"
        label-for="custom_{$kKundenfeld}"
        label="{$oKundenfeld->getLabel()}{if !$oKundenfeld->isRequired()}<span class='optional'> - {lang key='optional'}</span>{/if}"
    }
        {if isset($fehlendeAngaben.custom[$kKundenfeld])}
            <div class="form-error-msg" aria-live="assertive"><i class="fas fa-exclamation-triangle"></i>
                {if $fehlendeAngaben.custom[$kKundenfeld] === 1}
                    {lang key='fillOut' section='global'}
                {elseif $fehlendeAngaben.custom[$kKundenfeld] === 2}
                    {lang key='invalidDateformat' section='global'}
                {elseif $fehlendeAngaben.custom[$kKundenfeld] === 3}
                    {lang key='invalidDate' section='global'}
                {elseif $fehlendeAngaben.custom[$kKundenfeld] === 4}
                    {lang key='invalidInteger' section='global'}
                {/if}
            </div>
        {/if}
        {if $oKundenfeld->getType() === \JTL\Customer\CustomerField::TYPE_SELECT}
            {select
                id="custom_{$kKundenfeld}"
                name="custom_{$kKundenfeld}"
                disabled=!$isKundenattributEditable
                aria=["label"=>$oKundenfeld->getLabel()]
                required=$oKundenfeld->isRequired()
                class='custom-select'
            }
                <option value="" selected disabled>{lang key='pleaseChoose'}</option>
                {foreach $oKundenfeld->getValues() as $oKundenfeldWert}
                    <option value="{$oKundenfeldWert}" {if ($oKundenfeldWert == $cKundenattributWert)}selected{/if}>{$oKundenfeldWert}</option>
                {/foreach}
            {/select}
        {elseif $oKundenfeld->getType() === \JTL\Customer\CustomerField::TYPE_NUMBER}
            {inputgroup class="form-counter"}
                {inputgroupprepend}
                    {button variant=""
                        data=["count-down"=>""]
                        aria=["label"=>{lang key='decreaseQuantity' section='aria'}]}
                        <span class="fas fa-minus"></span>
                    {/button}
                {/inputgroupprepend}
                {input
                    type="number"
                    name="custom_{$kKundenfeld}"
                    id="custom_{$kKundenfeld}"
                    value="{$cKundenattributWert}"
                    placeholder=$oKundenfeld->getLabel()
                    aria=["label"=>$oKundenfeld->getLabel()]
                    required=$oKundenfeld->isRequired()
                    readonly=(!$isKundenattributEditable)
                }
                {inputgroupappend}
                    {button variant=""
                        data=["count-up"=>""]
                        aria=["label"=>{lang key='increaseQuantity' section='aria'}]}
                        <span class="fas fa-plus"></span>
                    {/button}
                {/inputgroupappend}
            {/inputgroup}
        {else}
            {input
                type="{if $oKundenfeld->getType() === \JTL\Customer\CustomerField::TYPE_DATE}date{else}text{/if}"
                name="custom_{$kKundenfeld}"
                id="custom_{$kKundenfeld}"
                value="{$cKundenattributWert}"
                placeholder=$oKundenfeld->getLabel()
                aria=["label"=>$oKundenfeld->getLabel()]
                required=$oKundenfeld->isRequired()
                data=["toggle"=>"floatLabel", "value"=>"no-js"]
                readonly=(!$isKundenattributEditable)
            }
        {/if}
    {/formgroup}
{/block}