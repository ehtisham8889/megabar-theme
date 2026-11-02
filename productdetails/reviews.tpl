{block name='productdetails-reviews'}
    <div class="reviews">
        {block name='productdetails-reviews-content'}
        {row id='reviews-overview'}
            
            {block name='productdetails-reviews-votes'}
                {if empty($smarty.get.quickView)}

                <div class="col-12 {if $Artikel->Bewertungen->oBewertungGesamt->nAnzahl > 0} col-md-4 col-lg-3{else} text-center col-md-12 col-lg-12{/if}">
                        {block name='productdetails-reviews-overview'}
                            
                                {if empty($smarty.get.quickView)}
                                    {$colsMD = 6}
                                    {$colsLG = 4}
                                {else}
                                    {$colsMD = 12}
                                    {$colsLG = 12}
                                {/if}
                                {if $Artikel->Bewertungen->oBewertungGesamt->nAnzahl > 0}
                                   <div class="mb-3">
                                        {block name='productdetails-reviews-heading'}
                                            <div>
                                                {assign var="sternenSummeAlle" value=0}
                                                {foreach name=sterne from=$Artikel->Bewertungen->nSterne_arr item=nSterne key=i}
                                                    {assign var=int1 value=5}
                                                    {math equation='x - y' x=$int1 y=$i assign='schluessel'}
                                                    {assign var=int2 value=100}
                                                    {math equation='(a/b)*c' a=$nSterne b=$Artikel->Bewertungen->oBewertungGesamt->nAnzahl c=$int2 assign='percent'}
                                                    {row}
                                                        

                                                        {if !empty($nSterne)}
                                                            {if $schluessel == 5}
                                                                {math equation='a * b' a=$nSterne b=$schluessel assign='summeSterne5'}
                                                               
                                                            {/if}
                                                            {if $schluessel == 4}
                                                                {math equation='a * b' a=$nSterne b=$schluessel assign='summeSterne4'}
                                                               
                                                            {/if}
                                                            {if $schluessel == 3}
                                                                {math equation='a * b' a=$nSterne b=$schluessel assign='summeSterne3'}
                                                              
                                                            {/if}
                                                            {if $schluessel == 2}
                                                                {math equation='a * b' a=$nSterne b=$schluessel assign='summeSterne2'}
                                                             
                                                            {/if}
                                                            {if $schluessel == 1}
                                                                {math equation='a * b' a=$nSterne b=$schluessel assign='summeSterne1'}
                                                              
                                                            {/if}
                                                        {else}
                                                            {if $schluessel == 5}
                                                                {math equation='a * b' a=0 b=$schluessel assign='summeSterne5'}
                                                             
                                                            {/if}
                                                            {if $schluessel == 4}
                                                                {math equation='a * b' a=0 b=$schluessel assign='summeSterne4'}
                                                            
                                                            {/if}
                                                            {if $schluessel == 3}
                                                                {math equation='a * b' a=0 b=$schluessel assign='summeSterne3'}
                                                               
                                                            {/if}
                                                            {if $schluessel == 2}
                                                                {math equation='a * b' a=0 b=$schluessel assign='summeSterne2'}
                                                              
                                                            {/if}
                                                            {if $schluessel == 1}
                                                                {math equation='a * b' a=0 b=$schluessel assign='summeSterne1'}
                                                               
                                                            {/if}
                                                        {/if}
                                                        
                                                    {/row}
                                                {/foreach}
                                                {math equation='f + g + h + j + k' f=$summeSterne1 g=$summeSterne2 h=$summeSterne3 j=$summeSterne4 k=$summeSterne5 assign="summeSterneAlle"}
                                                {math equation='k / l' k=$summeSterneAlle l=$Artikel->Bewertungen->oBewertungGesamt->nAnzahl assign="sterneDurschnitt"}
                                                <div class="mb-3" id="averageRatings" data-star-avg="{if $sterneDurschnitt|string_format:"%.1f" >= 1.0 && $sterneDurschnitt|string_format:"%.1f" < 1.5}1{/if}{if $sterneDurschnitt|string_format:"%.1f" >= 1.5 && $sterneDurschnitt|string_format:"%.1f" < 2.0}1.5{/if}{if $sterneDurschnitt|string_format:"%.1f" >= 2.0 && $sterneDurschnitt|string_format:"%.1f" < 2.5}2{/if}{if $sterneDurschnitt|string_format:"%.1f" >= 2.5 && $sterneDurschnitt|string_format:"%.1f" < 3.0}2.5{/if}{if $sterneDurschnitt|string_format:"%.1f" >= 3.0 && $sterneDurschnitt|string_format:"%.1f" < 3.5}3{/if}{if $sterneDurschnitt|string_format:"%.1f" >= 3.5 && $sterneDurschnitt|string_format:"%.1f" < 4.0}3.5{/if}{if $sterneDurschnitt|string_format:"%.1f" >= 4.0 && $sterneDurschnitt|string_format:"%.1f" < 4.5}4{/if}{if $sterneDurschnitt|string_format:"%.1f" >= 4.5 && $sterneDurschnitt|string_format:"%.1f" < 5.0}4.5{/if}{if $sterneDurschnitt|string_format:"%.1f" >= 5.0}5{/if}">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                                <p class="h2">
                                                    &Oslash; {$sterneDurschnitt|string_format:"%.1f"} 
                                                    <small>
                                                        aus {$Artikel->Bewertungen->oBewertungGesamt->nAnzahl} Bewertungen
                                                    </small>
                                                </p>
                                            </div>
                                            
                                        {/block}
                                        {block name='productdetails-reviews-rating-dropdown'}
                                       
                                        {/block}

                                        {block name='productdetails-reviews-votes'}
                                            {foreach name=sterne from=$Artikel->Bewertungen->nSterne_arr item=nSterne key=i}
                                                {assign var=int1 value=5}
                                                {math equation='x - y' x=$int1 y=$i assign='schluessel'}
                                                {assign var=int2 value=100}
                                                {math equation='(a/b)*c' a=$nSterne b=$Artikel->Bewertungen->oBewertungGesamt->nAnzahl c=$int2 assign='percent'}
                                                {row}
                                                    {col cols=5 sm=4}
                                                    {if isset($bewertungSterneSelected) && $bewertungSterneSelected === $schluessel}
                                                        <strong>
                                                    {/if}
                                                    {if $nSterne > 0 && (!isset($bewertungSterneSelected) || $bewertungSterneSelected !== $schluessel)}
                                                        {link class="ratelink" href="{$Artikel->cURLFull}?btgsterne={$schluessel}#tab-votes"}
                                                            <span class="text-primary rating" title="Artikelbewertung: {$schluessel}/5">
                                                                {if $schluessel == 5}
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                {/if}
                                                                {if $schluessel == 4}
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                {/if}
                                                                {if $schluessel == 3}
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                {/if}
                                                                {if $schluessel == 2}
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                {/if}
                                                                {if $schluessel == 1}
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                    <i class="far fa-star"></i>
                                                                {/if}
                                                            </span>
                                                        {/link}
                                                    {else}
                                                        
                                                            <span class="rating" title="Artikelbewertung: {$schluessel}/5">
                                                            {if $schluessel == 5}
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            {/if}
                                                            {if $schluessel == 4}
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                            {/if}
                                                            {if $schluessel == 3}
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                            {/if}
                                                            {if $schluessel == 2}
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                            {/if}
                                                            {if $schluessel == 1}
                                                                <i class="fas fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                                <i class="far fa-star"></i>
                                                            {/if}
                                                        </span>
                                                    {/if}
                                                    {if isset($bewertungSterneSelected) && $bewertungSterneSelected === $schluessel}
                                                        </strong>
                                                    {/if}
                                                    {/col}
                                                    {col cols=5 md=6}
                                                        {progress now=$percent|round min=0 max=100}
                                                    {/col}
                                                    {col cols=1 md=2}
                                                        {if !empty($nSterne)}{$nSterne}{else}0{/if}
                                                    {/col}
                                                {/row}
                                            {/foreach}
                                            {if isset($bewertungSterneSelected) && $bewertungSterneSelected > 0}
                                                {block name='productdetails-reviews-note-all-ratings'}
                                                    <hr>
                                                    {link href="{$Artikel->cURLFull}#tab-votes" class="btn btn-outline-primary btn-sm btn-block"}
                                                        {lang key='allRatings'}
                                                    {/link}
                                                {/block}
                                            {/if}
                                        {/block}
                                    </div>
                                {else}
                                    <p class="h2 d-block text-center">{lang key="noReviewsInAllLang" section="product rating"}</p>
                                {/if}
                                        {if JTL\Session\Frontend::getCustomer()->getID() === 0}  {*user is logged out, show inline login mask*}
                                            <span class="btn btn-outline-primary" id="loggedOutRating">{lang key='productAssess' section='product rating'}</span>
                    
                                            
                                            <div id="loginForRating" class="d-none pt-3 {if $Artikel->Bewertungen->oBewertungGesamt->nAnzahl < 1 && !$isMobile}col-4 offset-md-4{/if}">
                                        
                                                {include file='account/login.tpl' tplscope="rating"}
                                            </div>
                                            <script>
                                            $("#loggedOutRating").click(function(){
                                                $("#loginForRating").removeClass("d-none");
                                            })
                                            $('#login_form').on('submit',function(e){
                                                e.preventDefault();
                                                var formData = new FormData(this);
                                                    $.ajax({
                                                        type:'POST',
                                                        url: $('#login_form').attr('action'),
                                                        data:formData,
                                                        cache:false,
                                                        contentType: false,
                                                        processData: false,
                                                        success:function(result){
                                                        console.log(formData);
                                                            //alert("erfolgreich eingeloggt");
                                                            $("#loginForRating").addClass("d-none");
                                                            $("#ratingSubhead").addClass("d-none");
                                                            $("#sendReview").removeClass("d-none");
                                                            $("#loggedOutRating").addClass("d-none");
                                                           // sessionStorage.setItem("loginFromReview",true);
                                                           // location.reload();
                                                        },
                                                        error: function(result){
                                                            console.log(formData);
                                                            //alert("NICHT erfolgreich eingeloggt");
                                                        }
                                                    
                                                })
                                            })
                                            </script>
                                        {else} {* user is logged in, show toggle button for inline rating mask *}
                                            {if $bereitsBewertet === false}
                                                <span class="btn btn-outline-primary" id="logginInRating">{lang key='productAssess' section='product rating'}</span>    
                                            {else}
                                                <div class="alert alert-warning mb-1 pr-1 pl-1 pb-1 pt-1">
                                                    Du hast diesen Artikel bereits bewertet.
                                                </div>
                                            {/if}
                                            <script>
                                               
                                                $("#logginInRating").click(function(){
                                                    $("#sendReview").removeClass("d-none");
                                                    $("#logginInRating").addClass("d-none");
                                                    $("#ratingSubhead").addClass("d-none");
                                                    $("#howtoRateOuter").addClass("d-none").removeClass("d-inline-block");
                                                })
                                            </script>
                                        {/if}

                                        {if $ratingPagination->getPageItemCount() > 0}
                                            {block name='productdetails-reviews-verified-purchase-notice'}
                                                <small>
                                                    <span type="link" class="d-inline-block mb-3" id="howtoRateOuter" data-toggle="popover" data-content="{lang key='verifiedPurchaseNotice' section='product rating'}" data-original-title="" title="">
                                                        {lang key='reviewsHowTo' section='product rating'}
                                                    </span>
                                                </small>
                                            {/block}
                                        {/if}
                                    
                                
                            
                        {/block}
                    {block name='productdetails-reviews-reviews-in-lang'}
                       
                    {/block}
                </div>
                    
                <div class="{if $Artikel->Bewertungen->oBewertungGesamt->nAnzahl < 1}col-12 col-md-6 offset-md-3{else}col-12 col-md-6 col-lg-8{/if}">
                    <div class="subheadline d-none" id="ratingSubhead">
                        {if $Artikel->Bewertungen->oBewertungGesamt->nAnzahl == 0}
                            {lang key='firstReview'}
                        {else}
                            {lang key='shareYourExperience' section='product rating'}
                        {/if}
                    </div>

                        {block name='productdetails-review-form-form-inside'}
                        {form action="{get_static_route id='bewertung.php'}#tab-votes" id="sendReview" class="{if JTL\Session\Frontend::getCustomer()->getID() === 0}review-logged-out {/if}d-none jtl-validate" slide=true}
                                {block name='productdetails-review-form-alerts-inside'}
                                    {$alertList->displayAlertByKey('productNotBuyed')}
                                    {$alertList->displayAlertByKey('loginFirst')}
                                {/block}
                                
                                {*if $ratingAllowed*}
                                    
                                    {block name='productdetails-review-form-form-main-inside'}
                                        {row class="bg-white pt-3 pb-3 border-radius review-form-wrap"}
                                            {col cols=12 class="text-center mb-3 pb-3"}
                                                {block name='productdetails-review-form-form-info-inside'}
                                                    {if $bereitsBewertet === false}
                                                        
                                                    {else}
                                                        <div class="alert alert-warning">
                                                            Du hast diesen Artikel bereits bewertet - wenn sich deine Meinung geändert hat wird deine Bewertung zur erneuten Freischaltung eingereicht. Der ursprüngliche Beitrag verschwindet dann.
                                                        </div>
                                                    {/if}
                                                    <span class="h2">Deine Bewertung für <strong class="text-primary">{$Artikel->cName}</strong></span>
                                                {/block}
                                            {/col}
                                            {col cols=12 md=4 lg=3}
                                                {block name='productdetails-review-form-image-name-inside'}
                                                    <div class="review-form-image">
                                                        {include file='snippets/image.tpl' item=$Artikel square=false sizes='200px'}
                                                    </div>
                                                {/block}
                                            {/col}
                                            {col cols=12 md=6 lg=9}
                                                {block name='productdetails-review-form-rating-inside'}
                                                    {formgroup label-for="stars" id="select-formgroup" label="{lang key='productRating' section='product rating'}"}
                                                        {select name="nSterne" id="stars" class='custom-select' required=true}
                                                            {$ratings = [5,4,3,2,1]}
                                                            {foreach $ratings as $rating}
                                                                <option value="{$rating}"{if isset($oBewertung->nSterne) && (int)$oBewertung->nSterne === $rating} selected{/if}>
                                                                    {$rating}
                                                                    {if (int)$rating === 1}
                                                                        {lang key='starSingular' section='product rating'}
                                                                    {else}
                                                                        {lang key='starPlural' section='product rating'}
                                                                    {/if}
                                                                </option>
                                                            {/foreach}
                                                        {/select}
                                                    {/formgroup}
                                                    <span class="rating" id="fakeRateSelect"> {*far outline, fas full*}
                                                        <i class="far fa-star" data-star-select="1"></i>
                                                        <i class="far fa-star" data-star-select="2"></i>
                                                        <i class="far fa-star" data-star-select="3"></i>
                                                        <i class="far fa-star" data-star-select="4"></i>
                                                        <i class="far fa-star" data-star-select="5"></i>
                                                    </span>
                                                    <script>
                                                        $("#fakeRateSelect .fa-star").each(function(){
                                                            $(this).click(function(){
                                                                var starSelected = $(this).attr("data-star-select");
                                                                $("#stars").val(starSelected).change();
                                                                $("#fakeRateSelect .fa-star").each(function(){
                                                                    if ($(this).attr("data-star-select") <= starSelected) {
                                                                        $(this).removeClass("far").addClass("fas");
                                                                    }
                                                                    else {
                                                                        $(this).removeClass("fas").addClass("far");
                                                                    }
                                                                });
                                                                
                                                            })
                                                        })
                                                    </script>
                                                {/block}
                                                {block name='productdetails-review-form-inputs-inside'}
                                                    {formgroup label-for="headline" label="{lang key='headline' section='product rating'}"}
                                                        {input type="text" name="cTitel" placeholder=" " value=$oBewertung->cTitel|default:'' id="headline" value="Bewertung" required=true}
                                                    {/formgroup}
                                                    {formgroup label-for="comment" label="{lang key='comment' section='product rating'}"}
                                                        {textarea name="cText" cols="80" rows="8" id="comment" required=true placeholder=" "}{$oBewertung->cText|default:""}{/textarea}
                                                    {/formgroup}
                                                {/block}
                                                {block name='productdetails-review-form-form-submit-inside'}
                                                    {row class="review-form-buttons"}
                                                       
                                                        {col cols=12 md=6 lg=6 class='ml-auto-util'}
                                                            {input type="hidden" name="bfh" value="1"}
                                                            {input type="hidden" name="a" value=$Artikel->kArtikel}
                                                            {button type="submit" value="1" variant="primary" block=true}
                                                                {lang key='submitRating' section='product rating'}
                                                            {/button}
                                                        {/col}
                                                    {/row}
                                                    {row}
                                                        {col cols=12 class='text-right mt-3'}
                                                        <span type="link" class="verified-purchase-notice" id="howtoRateInner" data-toggle="popover" data-content="{lang key='verifiedPurchaseNotice' section='product rating'}" data-original-title="" title="">
                                                            {lang key='reviewsHowTo' section='product rating'}
                                                        </span>
                                                    {/col}
                                                    {/row}
                                                {/block}
                                            {/col}
                                        {/row}
                                    {/block}
                                    
                                {*/if*}
                            {/form}
                            <script>
                            $('#sendReview').on('submit',function(e){
                                e.preventDefault();
                                var formData = new FormData(this);
                                    $.ajax({
                                        type:'POST',
                                        url: $('#sendReview').attr('action'),
                                        data:formData,
                                        cache:false,
                                        contentType: false,
                                        processData: false,
                                        success:function(result){
                                        console.log(formData);
                                        //alert("bewertung erfolgreich");
                                        location.reload();
                                        },
                                        error: function(result){
                                            console.log(formData);
                                          //  alert("bewertung NICHT erfolgreich");
                                        }
                                    
                                })
                            })
                            </script>
                        {/block}

              
                        {if $ratingPagination->getPageItemCount() > 0}
                        
                            {block name='productdetails-reviews-include-pagination-bottom'}
                                {if empty($smarty.get.quickView)}
                                    {if $Artikel->Bewertungen->oBewertungGesamt->nAnzahl > 10}
                                        {include file='snippets/pagination.tpl' oPagination=$ratingPagination cThisUrl=$Artikel->cURLFull cParam_arr=['btgsterne'=>$bewertungSterneSelected] cAnchor='tab-votes'}
                                    {/if}
                                {/if}
                            {/block}
                            {block name='productdetails-reviews-form'}
                                {form id="reviews-list" method="post" action="{get_static_route id='bewertung.php'}#tab-votes" class="reviews-list" slide=true}
                                    {input type="hidden" name="bhjn" value="1"}
                                    {input type="hidden" name="a" value=$Artikel->kArtikel}
                                    {input type="hidden" name="btgsterne" value=$BlaetterNavi->nSterne}
                                    {input type="hidden" name="btgseite" value=$BlaetterNavi->nAktuelleSeite}
                                    {row}
                                    {foreach $ratingPagination->getPageItems() as $oBewertung}
                                        {block name='productdetails-reviews-form-include-review-item'}
                                            {col cols=12 md=6}
                                                {card class="review {if $oBewertung@last}last{/if}"}
                                                    {include file='productdetails/review_item.tpl' oBewertung=$oBewertung}
                                                {/card}
                                            {/col}
                                        {/block}
                                    {/foreach}
                                    {/row}
                                {/form}
                            {/block}
                            {block name='productdetails-reviews-include-pagination-bottom'}
                                {if empty($smarty.get.quickView)}
                                    {if $Artikel->Bewertungen->oBewertungGesamt->nAnzahl > 10}
                                        {include file='snippets/pagination.tpl' oPagination=$ratingPagination cThisUrl=$Artikel->cURLFull cParam_arr=['btgsterne'=>$bewertungSterneSelected] cAnchor='tab-votes' showFilter=false}
                                    {/if}
                                {/if}
                            {/block}
                        {/if}
                    
                    </div>
                {/if}

            {/block}
        {/row}
        {/block}

        
        {if isset($Artikel->HilfreichsteBewertung->oBewertung_arr[0]->nHilfreich) &&
            $Artikel->HilfreichsteBewertung->oBewertung_arr[0]->nHilfreich > 0
        }
            {block name='productdetails-reviews-form-most-useful'}
                {card class="reviews-mosthelpful" no-body=true}
                    {block name='productdetails-reviews-most-helpful-header'}
                        {cardheader}
                            <span class="h3">
                                {lang key='theMostUsefulRating' section='product rating'}
                            </span>
                        {/cardheader}
                    {/block}
                    {block name='productdetails-reviews-most-helpful'}
                        {form method="post" action="{get_static_route id='bewertung.php'}#tab-votes" slide=true}
                            {input type="hidden" name="bhjn" value="1"}
                            {input type="hidden" name="a" value=$Artikel->kArtikel}
                            {input type="hidden" name="btgsterne" value=$BlaetterNavi->nSterne}
                            {input type="hidden" name="btgseite" value=$BlaetterNavi->nAktuelleSeite}

                            {block name='productdetails-reviews-most-helpful-body'}
                                {cardbody class="review"}
                                    {foreach $Artikel->HilfreichsteBewertung->oBewertung_arr as $oBewertung}
                                        {block name='productdetails-reviews-form-most-useful-include-review-item'}
                                            {include file='productdetails/review_item.tpl' oBewertung=$oBewertung bMostUseful=true}
                                        {/block}
                                    {/foreach}
                                {/cardbody}
                            {/block}
                        {/form}
                    {/block}
                {/card}
            {/block}
        {/if}

        
    </div>
{/block}
