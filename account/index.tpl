{if JTL\Session\Frontend::getCustomer()->getID() === 0 &&  $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
    {block name='account-index'}
            {*not logged in *}
            {include file='layout/header.tpl' hLogin="ja"}
            {include file='snippets/b2b_login.tpl'}
    {/block}
{else}
    {block name='account-index-content'}
        {if isset($smarty.get.reg)}
            {block name='account-index-alert'}
                {container fluid=$Link->getIsFluid() class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
                    {alert variant="success"}{lang key='accountCreated' section='global'}{/alert}
                {/container}
            {/block}
        {/if}
        {block name='account-index-include-extension'}
            {include file='snippets/extension.tpl'}
        {/block}

        {if isset($nWarenkorb2PersMerge) && $nWarenkorb2PersMerge === 1}
            {block name='account-index-script-basket-merge'}
                {inline_script}<script>
                    eModal.addLabel('{lang key='yes' section='global' addslashes=true}', '{lang key='no' section='global' addslashes=true}');
                    var options = {
                        message: '{lang key='basket2PersMerge' section='login' addslashes=true}',
                        label: '{lang key='yes' section='global' addslashes=true}',
                        title: '{lang key='basket' section='global' addslashes=true}'
                    };
                    eModal.confirm(options).then(
                        function() {
                            window.location = "{get_static_route id='bestellvorgang.php'}?basket2Pers=1&token={$smarty.session.jtl_token}"
                        },
                        function() {
                            window.location = "{get_static_route id='jtl.php'}?updatePersCart=1&token={$smarty.session.jtl_token}"
                        }
                    );
                </script>{/inline_script}
            {/block}
        {/if}

        <div class="container-fluid container-fluid-xl">
            {opcMountPoint id='opc_before_account'}
           
            {row id="account"}
                {if JTL\Session\Frontend::getCustomer()->getID() === 0}
                {else}
                {col cols=12 md=3}
                    <div class="d-none d-md-block account-sidebar bg-light border-radius">
                    {block name='layout-header-shop-nav-account-logged-in-sidebar'} 
                        <ul>
                            {get_static_route id='jtl.php' secure=true assign='secureAccountURL'}
                            {navitem href=$secureAccountURL title="{lang key='myAccount'}" class="justify-content-start"}
                            <i class="fas fa-user"></i> {lang key='myAccount'}
                            {/navitem}
                            {navitem href="{$secureAccountURL}?bestellungen=1" title="{lang key='myAccount'}" class="justify-content-start"}
                                <i class="fas fa-box"></i> {lang key='myOrders'}
                            {/navitem}
                            {navitem href="{$secureAccountURL}?editRechnungsadresse=1" title="{lang key='myAccount'}" class="justify-content-start"}
                                <i class="fas fa-id-card"></i> {lang key='myPersonalData'}
                            {/navitem}
                            {navitem href="{$secureAccountURL}?editLieferadresse=1" title="{lang key='myAccount'}" class="justify-content-start"}
                                <i class="fas fa-file-import"></i> {lang key='myShippingAddresses'}
                            {/navitem}
                            {navitem href="{$secureAccountURL}?logout=1" title="{lang key='logOut'}" class="account-icon-dropdown-logout" class="justify-content-start"}
                                <i class="fas fa-sign-out-alt"></i> {lang key='logOut'}
                            {/navitem} 
                        </ul>
                    {/block}
                    </div>
                {/col}
                {/if}
                <div class="col cols-12 col-md-{if JTL\Session\Frontend::getCustomer()->getID() === 0}12{else}9{/if}">
                    {if $step === 'login'}
                        {if JTL\Session\Frontend::getCustomer()->getID() === 0}<div class="account-wrap-loggedout text-center">{/if}
                            {block name='account-index-include-login'}
                                {include file='account/login.tpl'}
                            {/block}
                        {if JTL\Session\Frontend::getCustomer()->getID() === 0}</div>{/if}
                    {elseif $step === 'mein Konto'}
                        {block name='account-index-include-my-account'}
                            {include file='account/my_account.tpl'}
                        {/block}
                    {elseif $step === 'rechnungsdaten'}
                        {block name='account-index-include-address-form'}
                            {include file='account/address_form.tpl'}
                        {/block}
                    {elseif $step === 'lieferadressen'}
                        {block name='account-index-include-shippingaddress-form'}
                            {include file='account/shipping_address_form.tpl'}
                        {/block}
                    {elseif $step === 'passwort aendern'}
                        {block name='account-index-include-change-password'}
                            {include file='account/change_password.tpl'}
                        {/block}
                    {elseif $step === 'manageTwoFA'}
                        {block name='account-index-include-manage-two-fa'}
                            {include file='account/two_fa.tpl'}
                        {/block}
                    {elseif $step === 'bestellung'}
                        {block name='account-index-include-order-details'}
                            {include file='account/order_details.tpl'}
                        {/block}
                    {elseif $step === 'bestellungen'}
                        {block name='account-index-include-orders'}
                            {include file='account/orders.tpl'}
                        {/block}
                    {elseif $step === 'account loeschen'}
                        {block name='account-index-include-delete-account'}
                            {include file='account/delete_account.tpl'}
                        {/block}
                    {elseif $step === 'kunden_werben_kunden'}
                        {block name='account-index-include-customers-recruiting'}
                            {include file='account/customers_recruiting.tpl'}
                        {/block}
                    {elseif $step === 'bewertungen'}
                        {block name='account-index-include-feedback'}
                            {include file='account/feedback.tpl'}
                        {/block}
                    {elseif $step === 'newRMA'}
                        {block name='account-index-include-new-rma'}
                            {if $Einstellungen.global.global_rma_enabled === 'Y'}
                                {include file='account/rma.tpl'}
                            {/if}
                        {/block}
                    {elseif $step === 'showRMA'}
                        {block name='account-index-include-show-rma'}
                            {if $Einstellungen.global.global_rma_enabled === 'Y'}
                                {include file='account/rma_summary.tpl' showButtons=false}
                            {/if}
                        {/block}
                    {elseif $step === 'rmas'}
                        {block name='account-index-include-rmalist'}
                            {if $Einstellungen.global.global_rma_enabled === 'Y'}
                                {include file='account/rma_list.tpl'}
                            {/if}
                        {/block}
                    {else}
                        {block name='account-index-include-my-account-default'}
                            {include file='account/my_account.tpl'}
                        {/block}
                    {/if}
                </div>
            {/row}
        </div>
    {/block}
{/if}