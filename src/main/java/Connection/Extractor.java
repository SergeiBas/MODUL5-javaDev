package Connection;

public class Extractor {

    public static StringBuilder getStringBuilder(String string) {
        StringBuilder builder = new StringBuilder();
        for (Character c : string.toCharArray()) {
            if (c != 59) {
                builder.append(c);
            } else {
                builder.append(";");
                break;
            }
        }
        return builder;
    }
}