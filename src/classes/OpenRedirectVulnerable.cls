public class OpenRedirectVulnerable {
    public PageReference redirectToUrl(String targetUrl) {
        // ⚠️ Vulnerable: user input is used directly for redirect
        PageReference ref = new PageReference(targetUrl);
        return ref;
    }
}
