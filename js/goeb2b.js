/* smoke2u b2b javascript addition */

function hijacker() {
    if ($("#ctrlwraper").length) {
        var hashStack = $("#ctrlwraper").attr("data-wrapper-id");
        var isAsd = 0;
        if ($("#ctrlwraper").hasClass("isAsd")) {
            isAsd = 1;
        }
        var ddtS = Date($.now());
        $(".price_wrapper, #smoke2u-marge").addClass("odtasd");
        if (isAsd=1) {
            $(".price_wrapper, #smoke2u-marge").addClass("intasd");
        }
        $("body").append("<style>.odtasd:before{content:'"+hashStack+"'}</style>")
    }
}

function easyUstCheck() {
    if ($("input#ustid").length) {
      
      if ($("#firmext").val().length > 0) {
      //  $("input#ustid").parents("div.form-group").show();
      }
      else {
       // $("input#ustid").parents("div.form-group").hide();
      }
      $("#ustid").parents("div.form-group").append("<div class='alert mt-3 alert-danger' id='ustmessage'>❌ Ungültige USt-IdNr.</div>");
      $("#firmext").keyup(function(){
        if ($("#firmext").val().length > 0) {
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
        //  $("input#ustid").parents("div.form-group").hide();
          $(".submit_once").show();
        }
      })
    }
  }


$(document).ready(function(){
    hijacker();
    easyUstCheck();
})