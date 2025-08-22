public with sharing class SSRFVulnerable {
    public void fetchData(String userUrl) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        // ⚠️ Vulnerable: user-controlled URL used directly
        request.setEndpoint(userUrl);
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        System.debug(response.getBody());
    }
}
