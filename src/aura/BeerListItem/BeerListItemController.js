({
	doInit : function(component) {
        var links;
        var beer = component.get("v.beer");       
        if (true) //{ //beer.Tags__c) 
        {
            var tags = beer.Tags__c.split(', ');
            component.set("v.tags", tags);
        }
    }    
})