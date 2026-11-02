/* smoke2u basis JS File */
function stickySidebar(){
  if ($("#leftBoxesHook").length) {
    if ($("aside .box-categories").length) {
      var sidebarOffset = $("header").height()+20;
      var sbo = sidebarOffset;
      $(".box-categories").addClass("position-sticky").css("top",sbo);
    }
  }
}
function cleanVarBoxes(){
  if ($(".productbox-hover").length) {
    if ($(".productbox-show-variations").length) {
      $(".productbox-show-variations").each(function(){
        $(this).removeClass("productbox-show-variations").removeClass("show-variation-collapse");
      })
    }
  }
}

function removeWeirdAnchorScrolls() {
  if ($("#result-wrapper #tabAccordion").length && $("body.mobile-device").length) {
    $("#result-wrapper #tabAccordion .card-header").each(function(){
      $(this).off();
    })
  }
  if ($("#tab-votes").length) {
    $("#tab-votes").off();
  }
}

function pageNavClick(){

  // ajax pagination reload fix 
  if ($(".navbar-pagination").length) {
    $(".js-pagination-ajax").click(function(){

      console.log("user nagivates to page "+ $(this).attr("href"));
      setTimeout(function(){
        $.ajax().then(function(){
          matchHeighter();
          matchHeighterSlider();
        });
      }, 200)
    })
  }
}
function inlinePWres(){
  if ($("#login_form").length) {
      if ($(".pwresetter").length) {
          $("#resetb2bpw").click(function(){
              $(".pwresetter").removeClass("d-none");
              $("#b2blogin > h1, #login_form").addClass("d-none");
              $(".alert").text("Bitte E-Mail-Adresse eingeben.");
          })
      }
  }
}

function seoLinks() {
  if ($("body.is-mobile").length) {
      console.log("is mobile device");
  }
  else {
    if ($(".smokelink").length) {
      $(".smokelink").each(function(){
        var linkHref = $(this).attr("data-href");
        var linkTarg = $(this).attr("data-target");
        if (linkTarg === undefined || linkTarg === "undefined") {
          linkTarg = "_self";
        }
        $(this).click(function(){
          window.open(
            linkHref,linkTarg
          );
        })
      })
    }
  }
}

function winCalc(){
  if ($(".smoke-win-calc").length) {
      $(".smoke-win-calc p").click(function(){
          $(this).toggleClass("show");
          $("#smoke2u-marge").toggleClass("show");
      })
  }
}

function smokeCat(){
  if ($(".catmore").length) {
  console.log("has catmore");
      $(".catmore").click(function(){
          $(".categorie-flame").toggleClass("catflame");
    $(this).toggleClass("catshow");
      });
  }
}

function smokeQuota() {
  if ($(".quota_image").length) {
      $(".quota_image").each(function(){
          var quotaBG = $(this).find("img").attr("src");
          $(this).parent().css("background-image","url("+quotaBG+")");
      })
  }
}

function overflowWatcher(){
  var overflowDiff = 0;
  if ($(document).width() > $("body").width()) {
    overflowDiff = $(document).width() - $("body").width();
    $("html").attr("data-ofd", overflowDiff);
  }
}

function matchHeighter(){
    if ($(".reviw-b").length) {
        $(".reviw-b").matchHeight();
    }
    if ($(".productbox-title > a").length) {
        $(".productbox-title > a").matchHeight();
    }
    if ($(".price_wrapper").length) {
        $(".price_wrapper").matchHeight();
    }
}

function matchHeighterSlider(){
    if ($(".slick-slider-other").length) {
        $(".slick-slider-other").each(function(){
            var slickItemHeight = $(this).find(".product-wrapper .productbox").height()+5;
            $(this).find(".product-wrapper").css("height", slickItemHeight);
        })
    }
}

function dropperSliderWatcher(){
    if ($(".kk-item-slider-root").length) {
        var docScroll = $(window).scrollTop();
        var docHeight = $(window).height();
        var docOT = docScroll+docHeight;
        var kkSlider = $(".kk-item-slider-root");
        kkSlider.each(function(){
          var kkOT = $(this).offset().top;
          var kkID = $(this).parents("div.drop-container").attr("data-container-drop");
         // console.log("KK-Slider "+kkID+" has offset top "+kkOT);
          if (docOT >= kkOT && ($(this).attr("data-autoheight") === undefined || $(this).attr("data-autoheight") === "undefined")) {
            //console.log("fire it up, man! undef");
            $(".kk-item-slider-root .productbox-title").matchHeight();
            $(this).attr("data-autoheight", "1");
            
          }
        })
     
    }
    
}
$(window).scroll(function(){
  dropperSliderWatcher();
})


function bRedirecter(){
  var locHead = location.pathname;
  if ($(".loggedOut").length || locHead !== "/Registrieren" || locHead !== "/Passwort-vergessen" || locHead !== "/AGB") {
      if (locHead == "/Registrieren") {
        console.log("regform");
      }
      if (locHead == "/Passwort-vergessen") {
        console.log("resform");
      }
      var targetLoc = location.pathname;
      console.log("user is logged out - target was "+targetLoc);
      sessionStorage.setItem("s2ured", targetLoc);
      $("#login_form button[type='submit']").click(function(){
          console.log("form was submitted");
      });

      var LoginLoc = sessionStorage.getItem("s2ured");
     
      if (LoginLoc == null) {
          
      }
      else {
          if (locHead == "/Mein-Konto" && LoginLoc == "/Mein-Konto" && location.search == "") {
              console.log("user was attempted to login");
              if ($("#b2blogin .alert").length) {

              }
              else {
                  $("#b2blogin h1").after('<div role="alert" class="w-100 alert alert-warning"><div class="sr-only">x</div>Bitte Zugangsdaten überprüfen.</div>');
              }
          }
          if (locHead == "/Mein-Konto" && LoginLoc == "/Mein-Konto" && location.search == "?loggedout=1") {
              console.log("user was logged in and logged out");
              $("#b2blogin h1").after('<div role="alert" class="w-100 alert alert-success"><div class="sr-only">x</div>Abmeldung erfolgreich.</div>');
          }
      }

  }
  else {
      var targetLoc = sessionStorage.getItem("s2ured");
     
      if (targetLoc == null) {
          
      } 
      else {
          if (locHead !== "/Registrieren") {
              location = location.origin+targetLoc;
              sessionStorage.removeItem("s2ured");
              
          }
          if (locHead !== "/Passwort-vergessen") {
              location = location.origin+targetLoc;
              sessionStorage.removeItem("s2ured");
              
          }
      }
  }
}

function ageChecker(){
  if ($("#agechecker").length) {
      if (sessionStorage.getItem("ageVerification") == null) {
        $("#agechecker").removeClass("d-none");
      }
      $("#agechecker .actions span").each(function(){
        var ageBtnType = $(this).attr("data-age-trigger");
        $(this).click(function(){
          if (ageBtnType === "yes") {
            //console.log("yes");
            sessionStorage.setItem("ageVerification", "yes");
            $("#agechecker").addClass("d-none");
          }
          else {
            var ageNoTarget = $("span[data-age-trigger='no']").attr("data-age-target");
            //console.log("no - redirecting to: "+ageNoTarget);
            location = ageNoTarget;
          }
        })
      })
  }
}

function spanscrl(){
  if ($(".spanscrl").length) {
      var headerHeight = $("#jtl-nav-wrapper").outerHeight();
      $(".spanscrl").each(function(){
          var scrlTarget = $(this).attr("data-target");
          var scrlDOM = $("#"+scrlTarget);
          var scrlOffset = scrlDOM.offset().top-headerHeight;
          $(this).click(function(){
              $(document).scrollTop(scrlOffset);
          })
      })
  }
}

function easyUstCheck() {
  if ($("input#ustid").length) {
    
    if ($("#firm").val().length > 0) {
      $("input#ustid").parents("div.form-group").show();
    }
    else {
      $("input#ustid").parents("div.form-group").hide();
    }
    $("#ustid").parents("div.form-group").append("<div class='alert mt-3 alert-danger' id='ustmessage'>❌ Ungültige USt-IdNr.</div>");
    $("#firm").keyup(function(){
      if ($("#firm").val().length > 0) {
        $("input#ustid").parents("div.form-group").show();
        $("#ustid").on("input", function() {
          
          let ustId = $(this).val().trim();
          let pattern = /^DE\d{9}$/; // DE + 9 Zahlen

          if (pattern.test(ustId)) {
              $("#ustmessage").text("✅ Gültige USt-IdNr.").addClass("alert-success").removeClass("alert-danger");
              $(".submit_once").show();
          } else {
              $("#ustmessage").text("❌ Ungültige USt-IdNr.").addClass("alert-danger").removeClass("alert-success");
              $(".submit_once").hide();
          }
        });
      }
      else {
        $("input#ustid").parents("div.form-group").hide();
        $(".submit_once").show();
      }
    })
  }
}

var ajaxCartID = "";
function prettyCart(){
  $(document).on('click', '.basket-details-add-to-cart', function(){
  //$(".basket-details-add-to-cart").click(function(){
    //console.log($(this).attr("id"));
    ajaxCartID = $(this).attr("id");
    if ($(this).parents(".kk-slider-item").length) {
      //console.log("yes, slider");
      $(this).parents(".kk-slider-item").addClass("product-wrapper");
    }
  })
}

// retrigger all content related scripts
$(document).on('evo:contentLoaded', function(){
  console.log("✅ loadContent done, launching.");
  removeWeirdAnchorScrolls();
  matchHeighterSlider();
  matchHeighter();
});

$(document).ready(function(){
    cleanVarBoxes();
    matchHeighter();
    matchHeighterSlider();
    seoLinks();
    spanscrl();
    //easyUstCheck();
    removeWeirdAnchorScrolls();
    inlinePWres();
    pageNavClick();
    smokeCat();
    overflowWatcher();
    prettyCart();
    winCalc();
    ageChecker();
    stickySidebar();
    bRedirecter();
    new WOW().init();
    smokeQuota();
    dropperSliderWatcher();
})
