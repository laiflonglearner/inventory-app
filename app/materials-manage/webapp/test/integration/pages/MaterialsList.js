sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.nadsportfolio.inventory.materialsmanage',
            componentId: 'MaterialsList',
            contextPath: '/Materials'
        },
        CustomPageDefinitions
    );
});