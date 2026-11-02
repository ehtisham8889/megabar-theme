{block name='account-login'}
    {if JTL\Session\Frontend::getCustomer()->getID() === 0 &&  $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"}
        {block name='account-login-heading'}
        {if $tplscope === "rating"}
            {else}
            {if $hLogin == "ja"}
                <div class="mr-auto ml-auto loggedOut">
            {/if}
            <p class="mb-3 text-center">
            {image width=180 src=$ShopLogoURL
                        alt=$Einstellungen.global.global_shopname
                        id="shop-logo"
                    }
            </p>
            {if $hLogin == "ja"}
                </div>
            {/if}
        {/if}
        {/block}
    {else}
    {block name='account-login-heading'}
        {if $tplscope === "rating"}
        {else}
        <h1>{if !empty($oRedirect->cName)}{$oRedirect->cName}{else}{lang key='loginTitle' section='login'}{/if}</h1>
        {/if}
    {/block}
    {/if}
    {if !$bCookieErlaubt}
        {block name='account-login-alert-no-cookie'}
            {alert variant="danger" class="d-none" id="no-cookies-warning"}
                <strong>{lang key='noCookieHeader' section='errorMessages'}</strong>
                <p>
                    {lang key='noCookieDesc' section='errorMessages' assign='noCookieDesc'}
                    {sprintf($noCookieDesc, $ShopURL)}
                </p>
            {/alert}
        {/block}
        {block name='account-login-script-no-cookie'}
            {inline_script}<script>
               $(function() {
                   if (navigator.cookieEnabled === false) {
                       $('#no-cookies-warning').show();
                   }
               });
            </script>{/inline_script}
        {/block}
    {elseif !$alertNote}
        {block name='account-login-alert'}
            {alert variant="info"}
                {lang key='loginDesc' section='login'}
                {if isset($oRedirect->cName) && $oRedirect->cName}{lang key='redirectDesc1'} {$oRedirect->cName} {lang key='redirectDesc2'}.{/if}
            {/alert}
        {/block}
    {/if}

    {block name='account-login-form'}
        {opcMountPoint id='opc_before_login'}
        {row class="login-form"}
            {if $hLogin == "ja"}
                <div class="col col-12">
            {else}
                <div class="col col-12 col-sm-8 col-lg-6">
            {/if}
                {form id="login_form" action="{get_static_route id='jtl.php'}" method="post" role="form" class="jtl-validate" slide=true}
                    {* Megabar: 2FA step from NOVA 5.8.2 login.tpl (was missing, customers with 2FA could not log in) *}
                    {if $showTwoFAForm|default:false}
                        {include file='snippets/two_fa_login.tpl'}
                    {else}
                    <fieldset>
                        {block name='account-login-form-submit-legend-login'}
                            {if JTL\Session\Frontend::getCustomer()->getID() === 0}
                            <legend>
                                {lang key='customerLoginHead' section='custom'}
                            </legend>
                            {else}
                            <legend>
                                {lang key='loginForRegisteredCustomers' section='checkout'}
                            </legend>
                            {/if}
                        {/block}
                        {block name='account-login-form-submit-body'}
                            {include file='snippets/form_group_simple.tpl'
                                options=[
                                    'email', 'email', 'email', null,
                                    {lang key='emailadress'}, true, null, "email"
                                ]
                            }

                            {include file='snippets/form_group_simple.tpl'
                                options=[
                                    'password', 'password', 'passwort', null,
                                    {lang key='password' section='account data'}, true, null, "current-password"
                                ]
                            }

                            {if isset($showLoginCaptcha) && $showLoginCaptcha}
                                {block name='account-login-form-submit-captcha'}
                                   {formgroup class="simple-captcha-wrapper"}
                                        {captchaMarkup getBody=true}
                                   {/formgroup}
                                {/block}
                            {/if}

                            {block name='account-login-form-submit'}
                                {formgroup class="login-form-submit"}
                                    {input type="hidden" name="login" value="1"}
                                    {if !empty($oRedirect->cURL)}
                                        {foreach $oRedirect->oParameter_arr as $oParameter}
                                            {input type="hidden" name=$oParameter->Name value=$oParameter->Wert}
                                        {/foreach}
                                        {input type="hidden" name="r" value=$oRedirect->nRedirect}
                                        {input type="hidden" name="cURL" value=$oRedirect->cURL}
                                    {/if}
                                    {block name='account-login-form-submit-button'}
                                        {button type="submit" value="1" block=true variant="primary"}
                                            {lang key='login' section='checkout'}
                                        {/button}
                                    {/block}
                                {/formgroup}
                            {/block}
                            {block name='account-login-form-submit-register'}
                                <span class="register-wrapper">
                                    {lang key='newHere'}
                                    {link class="register" href="{get_static_route id='registrieren.php'}"}
                                        {lang key='registerNow'}
                                    {/link}
                                </span>
                            {/block}
                            {block name='account-login-form-submit-resetpw'}
                                <span class="resetpw-wrapper">
                                   {link class="resetpw" href="{get_static_route id='pass.php'}"}
                                       <span class="fa fa-question-circle"></span> {lang key='forgotPassword'}
                                   {/link}
                                </span>
                            {/block}

                            {if $Einstellungen.template.smokegeneralsettings.smokeshoptype === "B2B"} 
                                {row id="loginhelper"}
                                    {col cols=12 md=6}
                                        {block name='account-back-to-b2c'}
                                            <a href="{lang key="backToURL" section="custom"}" class="mt-3 btn btn-primary w-100">{lang key="backTob2b" section="custom"}</a>
                                        {/block}
                                    {/col}
                                    {col cols=12 md=6}
                                        {block name='account-whatsapp-help'}
                                            <a href="{lang key="waHelpHREF" section="custom"}" class="mt-3 btn btn-whatsapp w-100 text-center"><i>{include file='snippets/mb_icon.tpl' mbIcon='whatsapp'}</i> {lang key="waHelpBTN" section="custom"}</a>
                                        {/block}
                                    {/col}
                                {/row}
                            {/if}

                        {/block}
                    </fieldset>
                    {/if}
                {/form}
                <div class="pwresetter d-none">
                    <p class="h1">{lang key='forgotPassword'}</p>
                    {block name='account-password-form-password-reset-from-login'}
                        {form id="passwort_vergessen"
                            action="{get_static_route id='pass.php'}"
                            method="post"
                            onsubmit="takeActions();return false;"
                            class="jtl-validate"
                            slide=true}
                            {block name='account-password-form-password-reset-content-from-login'}
                                <fieldset>
                                    {include file='snippets/form_group_simple.tpl'
                                        options=[
                                            'email', 'email', 'email', "{if $presetEmail !== ''}{$presetEmail}{/if}",
                                            {lang key='emailadress'}, true
                                        ]
                                    }
                                    {if (!isset($smarty.session.bAnti_spam_already_checked) || $smarty.session.bAnti_spam_already_checked !== true)
                                    && ($Einstellungen.kunden.forgot_password_captcha|default:'N')}
                                        <div class="form-group float-label-control{if isset($fehlendeAngaben.captcha) && $fehlendeAngaben.captcha !== false} has-error{/if}">
                                            {captchaMarkup getBody=true}
                                        </div>
                                        <hr>
                                    {/if}
                                    {block name='account-password-form-reset-submit-from-login'}
                                        {row}
                                            {col class='col-md-auto ml-md-auto'}
                                                {if $bExclusive === true}
                                                {input type="hidden" name="exclusive_content" value="1"}
                                                {/if}
                                                {input type="hidden" name="passwort_vergessen" value="1"}
                                                {button type="submit" value="1" block=true class="submit_once" variant="primary"}
                                                    {lang key='createNewPassword' section='forgot password'}
                                                {/button}
                                            {/col}
                                        {/row}
                                    {/block}
                                </fieldset>
                            {/block}
                        {/form}
                    {/block}
                    {if $nSeitenTyp !== 14}
                    <script>
                      $('#passwort_vergessen').on('submit',function(e){
                        e.preventDefault();
                        var formData = new FormData(this);
                            $.ajax({
                                type:'POST',
                                url: $('#passwort_vergessen').attr('action'),
                                data:formData,
                                cache:false,
                                contentType: false,
                                processData: false,
                                success:function(result){
                                  if ($(".alert").length) {
                                    $(".alert").removeClass("alert-info").addClass("alert-success").text("Wenn unter der angegebenen E-Mail-Adresse ein Händlerkonto existiert wurden die weiteren Anweisungen zur Vergabe eines neuen Passworts soeben an diese E-Mail-Adresse geschickt.");
                                    $(".pwresetter").addClass("d-none");
                                    setTimeout(function(){
                                        $("#login_form, #b2blogin h1").removeClass("d-none");
                                    }, 2500);
                                  }
                                },
                                error: function(result){
                                    if ($(".alert").length) {
                                        $(".alert").removeClass("alert-info").addClass("alert-warning").text("Die angengebene E-Mail-Adresse konnte nicht gefunden werden.");
                                    }
                                }
                            
                        })
                    })
                    </script>
                    {/if}
                </div>
            </div>
        {/row}
    {/block}
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
{/block}
