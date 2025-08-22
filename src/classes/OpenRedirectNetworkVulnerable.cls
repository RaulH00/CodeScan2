global with sharing class OpenRedirectNetworkVulnerable {
    webservice static void forwardToLogin(String loginUrl) {
        // ⚠️ Vulnerable: user input directly used in redirect method
        Network.forwardToAuthPage(loginUrl);
    }
}
