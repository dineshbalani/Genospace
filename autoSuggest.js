var eNames = {    
    "product": "#Product",    
}

$(document).ready(function () {
    $(function () {
        var cache = {};
        $(eNames["product"]).autocomplete({
            minLength: 3,
            type: "GET",
            change: function (event, ui) {                
                getMedicine();
                getMechanism();                
            }
        });
    });
    //autocomplete code (used from External ID)
})

function getMedicine() {
    var productName = $(eNames["product"]).val();
    if (productName.length != 0) {
        $.post(window.location.origin + "//Request/suggestMedicines/", { id: productName }, function (data) {
            if (data != null) {
                fillMedicineList(data);
            }
            else {
                //medicine name not found;
            }
        });
    }
}

function getMechanism() {
    var productName = $(eNames["product"]).val();
    if (productName.length != 0) {
        $.post(window.location.origin + "//Request/suggestMedicines/", { id: productName }, function (data) {
            if (data != null) {
                fillMechanismList(data);
            }
            else {
                //mechanis not found
            }
        });
    }
}

function fillMedicineList(){
    //Empty the list
    //Dynamically fill the MedicineList
}

function fillMechanismList(){
    //Empty the list
    //Dynamically fill the MechnaismList
}

function getMedicineDetails(medicineId){
    if (productName.length != 0) {
        $.post(window.location.origin + "//Request/getMedicineInfo/", { id: productName }, function (data) {
            if (data != null) {
                // #mechanismDetails visitbility false
                // #medicineDetails visibility true
            }
            else {
                // medicine not found
            }
        });
    }
}

function getMechanismDetails(mechanismID){
    if (productName.length != 0) {
        $.post(window.location.origin + "//Request/getMechanismInfo/", { id: productName }, function (data) {
            if (data != null) {
                // #mechanismDetails visitbility true
                // #medicineDetails visibility false
            }
            else {
                //mechanism not found
            }
        });
    }
}


