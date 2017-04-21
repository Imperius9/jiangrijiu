package tool;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * Created by 花间一壶酒 on 2017/4/2.
 */
public final class CookieMethod {
    public static String getCookie(HttpServletRequest Request, String name){
        String stringCookie= Arrays.toString(Request.getCookies());
        String[] cookieSplit=stringCookie.split(";");
        for (String aCookieSplit : cookieSplit) {
            String[] cookieValue = aCookieSplit.split("=");
            if (name.equals(cookieValue[0])) {
                return cookieValue[1];
            }
        }
        return null;
    }
}
