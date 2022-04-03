window.handleGetGeoGraphicIframe = function (iframe, kinhdo, vido) { 
    const iframeVal = iframe.val();
    const pattern = /2d\d{1,10}.\d{1,20}!3d\d{1,10}.\d{1,20}/;
    const reg = new RegExp(pattern);
    if (iframeVal !== null || iframeVal !== "") {
        const matches = reg.exec(iframeVal);
        const splited = matches[0].split('!');
        if (splited.length > 1) {
            const longtitude = splited[0].replace('2d', '');
            const latitude = splited[1].replace('3d', '');
            kinhdo.val(latitude);
            vido.val(longtitude);
        }
    }
}
    