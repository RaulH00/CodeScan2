public class OpenRedirectSafe {
    public PageReference redirectToUrl(String targetKey) {
        // ✅ Safe: Only allow redirect to whitelisted paths
        Map<String, String> allowedPages = new Map<String, String>{
            'home' => '/home',
            'dashboard' => '/dashboard',
            'profile' => '/user/profile'
        };

        if (!allowedPages.containsKey(targetKey)) {
            throw new IllegalArgumentException('Invalid redirect target');
        }

        PageReference ref = new PageReference(allowedPages.get(targetKey));
        return ref;
    }
}
