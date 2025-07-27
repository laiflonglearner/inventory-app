sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/nadsportfolio/inventory/materialsmanage/test/integration/FirstJourney',
		'com/nadsportfolio/inventory/materialsmanage/test/integration/pages/MaterialsList',
		'com/nadsportfolio/inventory/materialsmanage/test/integration/pages/MaterialsObjectPage'
    ],
    function(JourneyRunner, opaJourney, MaterialsList, MaterialsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/nadsportfolio/inventory/materialsmanage') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMaterialsList: MaterialsList,
					onTheMaterialsObjectPage: MaterialsObjectPage
                }
            },
            opaJourney.run
        );
    }
);