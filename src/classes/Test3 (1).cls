public class PatternConverter {
    private static final String SPECIAL_CHARS = '\\^$.|?*+()[]{}'; // Define special characters to escape

    public static String toRegexp(String antPattern, String directorySeparator) {
        // Handle edge case for empty antPattern
        if (antPattern == null || antPattern.isEmpty()) {
            return '^$'; // Match an empty string
        }

        String escapedDirectorySeparator = '\\' + directorySeparator;
        StringBuilder sb = new StringBuilder(antPattern.length());
        sb.append('^');
        Integer i = (antPattern.startsWith('/') || antPattern.startsWith('\\')) ? 1 : 0;

        while (i < antPattern.length()) {
            Char ch = antPattern.charAt(i);
            if (SPECIAL_CHARS.indexOf(String.valueOf(ch)) != -1) {
                sb.append('\\').append(ch);
            } else if (ch == '*') {
                if (i + 1 < antPattern.length() && antPattern.charAt(i + 1) == '*') {
                    if (i + 2 < antPattern.length() && isSlash(antPattern.charAt(i + 2), directorySeparator)) {
                        sb.append('(?:.*').append(escapedDirectorySeparator).append('|)');
                        i += 2;
                    } else {
                        sb.append('.*');
                        i += 1;
                    }
                } else {
                    sb.append('[^').append(escapedDirectorySeparator).append(']*?');
                }
            } else if (ch == '?') {
                sb.append('[^').append(escapedDirectorySeparator).append(']');
            } else if (isSlash(ch, directorySeparator)) {
                sb.append(escapedDirectorySeparator);
            } else {
                sb.append(ch);
            }
            i++;
        }
        sb.append('$');
        return sb.toString();
    }

    private static Boolean isSlash(Char ch, String directorySeparator) {
        return String.valueOf(ch) == directorySeparator || String.valueOf(ch) == '/';
    }
}

// Example usage

