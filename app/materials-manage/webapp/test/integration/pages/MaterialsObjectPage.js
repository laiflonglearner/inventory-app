sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.nadsportfolio.inventory.materialsmanage',
            componentId: 'MaterialsObjectPage',
            contextPath: '/Materials'
        },
        CustomPageDefinitions
    );
});