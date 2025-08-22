public without sharing class AccountSearch {
 
  global someReturnType GetNavigationList (Request request) {
 
        someType originalProvider = new someType();
 
        request.Id = idParts[0];
 
        if (idParts.size() == 3 && String.isNotBlank(idParts[2])) {
 
            String recordId = idParts[2];
 
            List<Knowledge__kav> records = [SELECT ACN_NavigationTags__c FROM Knowledge__kav WHERE Id = :recordId OR KnowledgeArticleId = :recordId];
 
        }
 
        // method call with same name
 
        ACN_NavigationLibrary.NavigationList navList = originalProvider.GetNavigationList(request);
 
        return navList;
 
  }
 
}
