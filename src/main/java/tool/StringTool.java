package tool;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by 花间一壶酒 on 2017/3/9.
 */
public final class StringTool {
    //判断string中的字符全为数字
    public static Boolean isNumeric(String str) {
        if (str != null) {
            Pattern pattern = Pattern.compile("[0-9]*");
            Matcher isNum = pattern.matcher(str);
            return isNum.matches();
        }
        return false;
    }

    //判断string中的字符串为一个邮箱
    public static Boolean isMaileic(String str) {
        if (str != null) {
            if (str.indexOf("@") > 0 && str.indexOf(".") > str.indexOf("@")) {
                return true;
            }
        }
        return false;
    }

}
