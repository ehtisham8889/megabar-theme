

// TRACK AND TRACE - NON GOE

// $(document).ready(function () {
  // Select EOID FIELD
  var eoidLabel = $('label[for="custom_2"]');
  var eoidField = $("#custom_2");
  // Select EOID ergänzen FIELD
  var eoid2Label = $('label[for="custom_3"]');
  var eoid2Field = $("#custom_3");
  // Select FID FIELD
  var fidLabel = $('label[for="custom_4"]');
  var fidField = $("#custom_4");
  // Select FID ergänzen FIELD
  var fid2Label = $('label[for="custom_5"]');
  var fid2Field = $("#custom_5");
  
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const group = urlParams.get("Kundengruppe");
  if (group == "1") {
    // Hide EOID FIELD
    eoidLabel.hide();
    eoidField.hide();
    // Hide EOID2 FIELD
    eoid2Label.hide();
    eoid2Field.hide();
    // Hide FID FIELD
    fidLabel.hide();
    fidField.hide();
    // Hide FID2 FIELD
    fid2Label.hide();
    fid2Field.hide();
  } else {
    // URL for Kundengruppe = 2
    const htmlElem = `
    <div class='labeling' style="margin-left:10px;">
    <h3>Track & Trace</h3>
    <p>Um Sie auch nach dem 20.05.2024 mit Tabak Produkten beliefern zu können tragen Sie bitte hier passend zur angegebenen Adresse Ihre EOID und FID ein. Sollten Sie diese Nummern noch nicht haben oder Hilfe benötigen wenden Sie sich bitte an unseren Support.</p>
    </div>`;
    eoidLabel.parent().parent().before(htmlElem);

    // Remove "optionale Angabe" from EOID label text
    eoidLabel.text("EOID");
    // Set the value and disable the EOID field
    eoidField.val("QCBDR").attr("disabled", "disabled");
    // Set placeholder for EOID2 field
    eoid2Field.attr("placeholder", "1DE123456");
    // Set the value and disable the FID field
    fidField.val("QCBDR").attr("disabled", "disabled");
    // Set placeholder for FID2 field
    // Remove "optionale Angabe" from EOID label text
    fidLabel.text("FID");

    fid2Field.attr("placeholder", "1DE123456789012");

    // //
    // Create the first row div
    var rowDiv1 = $("<div>").addClass("row justify-content-center").attr("id","trackTrace");
  
    // Create the first col-md-5 div and append the existing input and label
    var colDiv1 = $("<div>").addClass("col-md-3");
    var flexDiv1 = $("<div>").addClass("d-flex flex-column"); // Use flex-column instead of flex-column-reverse

    flexDiv1.append(eoidLabel); // Append the existing label
    flexDiv1.append(eoidField);
    colDiv1.append(flexDiv1);

    // // Create the col-md-1 div
    var colDiv2 = $("<div>")
      .addClass("col-md-1 d-flex align-items-center justify-content-center")
      .css({
        marginTop: "30px",
        width: "3.3%",
      });

    // Create the span element
    var span1 = $("<span>").css("fontSize", "x-large").text("+");
    colDiv2.append(span1);

    // Create the second col-md-6 div and append the existing input and label
    var colDiv3 = $("<div>").addClass("col-md-8");
    var flexDiv2 = $("<div>").addClass("d-flex flex-column");
    flexDiv2.append(eoid2Label); // Append the existing label
    flexDiv2.append(eoid2Field);
    colDiv3.append(flexDiv2);
    $("<hr>").insertAfter(fid2Label.parent());

    // Append all columns to rowDiv1
    rowDiv1.append(colDiv1);
    rowDiv1.append(colDiv2);
    rowDiv1.append(colDiv3);

    // SECOND ROW for FID fields
    // Create the second row div
    var rowDiv2 = $("<div>")
      .addClass("row justify-content-center")
      .css("marginTop", "10px");

    // Create the first col-md-5 div and append the existing input and label
    var colDiv4 = $("<div>").addClass("col-md-3");
    var flexDiv3 = $("<div>").addClass("d-flex flex-column");
    flexDiv3.append(fidLabel); // Append the existing label
    flexDiv3.append(fidField);
    colDiv4.append(flexDiv3);

    // Create the col-md-1 div
    var colDiv5 = $("<div>")
      .addClass("col-md-1 d-flex align-items-center justify-content-center")
      .css({
        marginTop: "30px",
        width: "3.3%",
      });

    // Create the span element
    var span2 = $("<span>").css("fontSize", "x-large").text("<");
    colDiv5.append(span2);

    // Create the second col-md-6 div and append the existing input and label
    var colDiv6 = $("<div>").addClass("col-md-8");
    var flexDiv4 = $("<div>").addClass("d-flex flex-column");
    flexDiv4.append(fid2Label); // Append the existing label
    flexDiv4.append(fid2Field);
    colDiv6.append(flexDiv4);

    // Append all columns to rowDiv2
    rowDiv2.append(colDiv4);
    rowDiv2.append(colDiv5);
    rowDiv2.append(colDiv6);

    // Append both rows to the body or any other container
    $(".labeling").append(rowDiv1);
    $(".labeling").append(rowDiv2);

    // ERROR Messages
    // Create the EOID error message element
    var errorMessage = $("<div>")
      .attr("id", "error-message")
      .css({ color: "red", display: "none", marginTop: "3px" })
      .text("EOID2 muss genau 9 Zeichen lang sein!");

    // Append the error message to the parent of the input field
    eoid2Field.parent().append(errorMessage);

    // Add event listener to validate input length
    eoid2Field.on("input", function () {
      var value = $(this).val();
      if (value.length !== 9) {
        console.log("Input must be exactly 9 characters long");
        errorMessage.show();
      } else {
        errorMessage.hide();
      }
    });

    // Create the FID error message element
    var FIDErrorMessage = $("<div>")
      .attr("id", "error-message")
      .css({ color: "red", display: "none", marginTop: "3px" })
      .text("FID2 muss genau 15 Zeichen lang sein!");

    // Append the error message to the parent of the input field
    fid2Field.parent().append(FIDErrorMessage);

    // Add event listener to validate input length
    fid2Field.on("input", function () {
      var value = $(this).val();
      if (value.length !== 15) {
        console.log("Input muss genau 15 Zeichen lang sein!");
        FIDErrorMessage.show();
      } else {
        FIDErrorMessage.hide();
      }
    });
  }
// });

