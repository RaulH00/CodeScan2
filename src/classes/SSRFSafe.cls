public with sharing class SSRFSafe {
    public void fetchData(String resourceId) {
        // ✅ Safe: fixed and validated endpoint
        String baseUrl = 'https://api.example.com/resource/';

        if (!String.isBlank(resourceId) && resourceId.matches('[a-zA-Z0-9_-]+')) {
            String endpoint = baseUrl + EncodingUtil.urlEncode(resourceId, 'UTF-8');

            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint);
            request.setMethod('GET');

            HttpResponse response = http.send(request);
            System.debug(response.getBody());
        }
    }
}
