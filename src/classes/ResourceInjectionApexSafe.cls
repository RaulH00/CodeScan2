public class ResourceInjectionApexSafe {
    public void loadFile(String fileKey) {
        // ✅ Safe: validated input against whitelist pattern
        if (!fileKey.matches('[a-zA-Z0-9_-]+')) {
            throw new IllegalArgumentException('Invalid file key');
        }
        String filePath = '/documents/' + fileKey + '.pdf';
        Blob fileData = FileService.readFile(filePath);
        System.debug(fileData);
    }
}
