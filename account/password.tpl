{block name='account-password-heading' prepend}
    
    {if JTL\Session\Frontend::getCustomer()->getID() === 0 && $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
    <div id="unlogged">
        <div class="container">
            <p class="mb-3 text-center">
            {image width=180 src=$ShopLogoURL
                        alt=$Einstellungen.global.global_shopname
                        id="shop-logo"
                    }
            </p>
            <div class="text-center justify-content-center d-flex flex-wrap">
    {/if}
{/block}

{block name='account-password-include-footer' prepend}
    {if JTL\Session\Frontend::getCustomer()->getID() === 0 && $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
            </div>
        </div>
    </div>       
    <style>
    #unlogged {
        z-index:332;
    }
    .account-password > .row {
        justify-content:center!important;
    }
    #alert-list {
        position:relative;
        z-index:333;
    }
    </style>
   
    {/if}
{/block}

{if JTL\Session\Frontend::getCustomer()->getID() === 0 && $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
    {block name='account-password-include-footer'}
    {/block}
{/if}