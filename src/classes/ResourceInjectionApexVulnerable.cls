public class ResourceInjectionApexVulnerable {
    public void loadFile(String userInput) {
        // ⚠️ Vulnerable: user input directly controls resource path
        String filePath = '/documents/' + userInput;
        Blob fileData = FileService.readFile(filePath);
        System.debug(fileData);
    }
}
