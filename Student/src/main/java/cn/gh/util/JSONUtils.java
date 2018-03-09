package cn.gh.util;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import org.apache.log4j.Logger;
import org.junit.platform.commons.util.StringUtils;

import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;

/**
 * JSON帮助类
 * 
 * @author liujt
 * @mail liujt@gaiay.cn
 */

public class JSONUtils {
	private static Logger logger = Logger.getLogger(JSONUtils.class);
	public static final String EMPTY = "";
	public static final String EMPTY_JSON = "{}";
	public static final String EMPTY_JSON_ARRAY = "[]";
	private static final GsonBuilder gsonBuilder = new GsonBuilder();

	/**
	 * 将对象转为JSON
	 * 
	 * @param obj
	 *            对象
	 * @return String
	 */
	public static String toJSON(Object obj) {
		return toJson(obj, null);
	}

	/**
	 * 将对象转换为字符串
	 * 
	 * @param target
	 * @param targetType
	 * @return
	 */
	public static String toJson(Object target, Type targetType) {
		Gson gson = gsonBuilder.serializeNulls().create();
		if (target == null) {
			return EMPTY_JSON;
		}
		String result = EMPTY;
		try {
			if (targetType != null) {
				result = gson.toJson(target, targetType);
			} else {
				result = gson.toJson(target);
			}
		} catch (Exception ex) {
			logger.warn("目标对象 " + target.getClass().getName()
					+ " 转换 JSON 字符串时，发生异常！", ex);
			if (target instanceof Collection || target instanceof Iterator
					|| target instanceof Enumeration
					|| target.getClass().isArray()) {
				result = EMPTY_JSON_ARRAY;
			} else
				result = EMPTY_JSON;
		}
		return result;
	}

	/**
	 * 将字符串转换为对象
	 * 
	 * @param json
	 *            字符串
	 * @param token
	 *            要转换的对象
	 * @return T
	 */
	public static <T> T fromJson(String json, TypeToken<T> token) {
		Gson gson = new Gson();
		if (StringUtils.isBlank(json)) {
			return null;
		}
		try {
			return gson.fromJson(json, token.getType());
		} catch (Exception ex) {
			logger.error(json + " 无法转换为 " + token.getRawType().getName()
					+ " 对象!", ex);
			return null;
		}
	}
	
	public static<T> T fromJson(JsonElement el,TypeToken<T> token){
		Gson gson = new Gson();
		if (el == null) {
			return null;
		}
		try {
			return gson.fromJson(el, token.getType());
		} catch (Exception ex) {
			logger.error(el + " 无法转换为 " + token.getRawType().getName()
					+ " 对象!", ex);
			return null;
		}
	}

	/**
	 * 将字符串转换为对象
	 * 
	 * @param json
	 *            字符串
	 * @param clazz
	 *            类
	 * @param datePattern
	 *            日期格式
	 * @return T
	 */
	public static <T> T fromJson(String json, Class<T> clazz) {
		Gson gson = new Gson();
		if (StringUtils.isBlank(json)) {
			return null;
		}
		try {
			return gson.fromJson(json, clazz);
		} catch (Exception ex) {
			logger.error(json + " 无法转换为 " + clazz.getName() + " 对象!", ex);
			return null;
		}
	}
	
	/**
	 * 判断json是否为正确格式
	 * 
	 * @param jsonStr
	 * @return
	 */
	public static boolean isJSON(String jsonStr) {
		if (StringUtils.isBlank(jsonStr)) {
			return false;
		}
		try {
			new JsonParser().parse(jsonStr);
			return true;
		} catch (JsonParseException e) {
			logger.error(jsonStr + "json格式错误!", e);
			return false;
		}
	}

}
