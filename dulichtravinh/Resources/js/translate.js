window.translateDiaDiem = function () {
    const inputTenDiaDiem = $(`#${PREFIX}_txtTenDiaDiem`).val() || "";
    const inputMota = $(`#${PREFIX}_txtMoTa`).val() || "";
    const translateTenDiaDiem = $.ajax({
        url: "/Services/DichVanBan.asmx/Dich",
        type: "POST",
        data: '{ input: "' + inputTenDiaDiem + '" }',
        contentType: "application/json; charset=UTF-8",
        processData: false,
        dataType: "json"
    })
    const translateMoTa = $.ajax({
        url: "/Services/DichVanBan.asmx/Dich",
        type: "POST",
        data: '{ input: "' + inputMota + '" }',
        contentType: "application/json; charset=UTF-8",
        processData: false,
        dataType: "json"
    })
    $.when(translateTenDiaDiem, translateMoTa).done(function (res1, res2) {
        if (res1[0].d !== "") {
            $(`#${PREFIX}_txtTenDiaDiemTiengAnh`).val(JSON.parse(res1[0].d).Text);
        }
        if (res2[0].d !== "") {
            $(`#${PREFIX}_txtMoTaTiengAnh`).text(JSON.parse(res2[0].d).Text);
            editors['txtMoTaTiengAnh'].setData(JSON.parse(res2[0].d).Text)
        }
    }) 
} 