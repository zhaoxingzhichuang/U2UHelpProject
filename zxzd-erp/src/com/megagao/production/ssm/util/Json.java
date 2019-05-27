package com.megagao.production.ssm.util;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;


public class Json{
	
  private static ObjectMapper mapper = new ObjectMapper();

  public static String bean2Json(Object obj) {
    try {
      return mapper.writeValueAsString(obj);
    } catch (IOException e) {
      e.printStackTrace();
    }return null;
  }

  public static <T> List<Map<String, String>> listbean2Json(List<T> obj)
  {
    try {
      String str = "";
      for (int i = 0; i < obj.size(); i++) {
        str = str + mapper.writeValueAsString(obj.get(i));
      }
      return Json22ListMap(str);
    } catch (Exception e) {
      e.printStackTrace();
    }return null;
  }

  public static String Map2Json(Map<?, ?> map) {
    try {
      return mapper.writeValueAsString(map);
    } catch (IOException e) {
      e.printStackTrace();
    }return null;
  }

  public static String List2Json(List<?> list)
  {
    try
    {
      return mapper.writeValueAsString(list);
    } catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }

  public static <T> T Json2Been(String jsonStr, Class<T> clazz)
  {
    if (StringUtils.isEmpty(jsonStr))
      return null;
    try
    {
      return mapper.readValue(jsonStr, clazz);
    } catch (IOException e) {
      e.printStackTrace();
    }return null;
  }

  public static <T> T Json2Map(String jsonStr)
  {
    try
    {
      return (T) mapper.readValue(jsonStr, Map.class); } catch (Exception e) {
    }
    return null;
  }

  public static List<Object> jsonToList(JSONArray jsonArr)
  {
    List list = new ArrayList();
    for (Iterator localIterator = jsonArr.iterator(); localIterator.hasNext(); ) { Object obj = localIterator.next();
      if ((obj instanceof JSONArray))
        list.add(jsonToList((JSONArray)obj));
      else if ((obj instanceof JSONObject))
        list.add(jsonToMap((JSONObject)obj));
      else {
        list.add(obj);
      }
    }
    return list;
  }

  public static Map<String, Object> jsonStrToMap(String json)
  {
    try
    {
      JSONObject obj = JSONObject.fromObject(json);

      return jsonToMap(obj); } catch (Exception e) {
    }
    return null;
  }

  public static Map<String, Object> jsonToMap(JSONObject obj)
  {
    Set set = obj.keySet();
    Map map = new HashMap(set.size());
    for (Iterator localIterator = obj.keySet().iterator(); localIterator.hasNext(); ) { Object key = localIterator.next();
      Object value = obj.get(key);
      if ((value instanceof JSONArray))
        map.put(key.toString(), jsonToList((JSONArray)value));
      else if ((value instanceof JSONObject))
        map.put(key.toString(), jsonToMap((JSONObject)value));
      else {
        map.put(key.toString(), obj.get(key));
      }
    }

    return map;
  }

  public static <T> List<T> Json2List(String jsonVal, Class<?> clazz) {
    TypeFactory t = TypeFactory.defaultInstance();
    List list = null;
    try {
      list = (List)mapper.readValue(jsonVal, 
        t.constructCollectionType(ArrayList.class, clazz));
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  public static List<HashMap<String, Object>> Json2ListMap(String json)
  {
    try
    {
      List list = (List)mapper.readValue(json, 
        List.class);
      return list;
    } catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }

  public static List<Map<String, String>> Json22ListMap(String json)
  {
    try
    {
      List list = (List)mapper.readValue(json, 
        List.class);
      return list;
    } catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }

  public static List<Object> Json2List(String json) {
    try {
      List list = (List)mapper.readValue(json, List.class);
      return list;
    } catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }

  public static JavaType getCollectionType(Class<?> collectionClass, Class<?>[] elementClass)
  {
    return mapper.getTypeFactory().constructParametricType(collectionClass, elementClass);
  }

  public static <T> List<Map<String, String>> ListObjToListMap(List<T> list)
  {
    List lm = new ArrayList();

    if (list.size() > 0) {
      for (int j = 0; j < list.size(); j++) {
        Map reMap = new HashMap();
        if (list.get(j) == null)
          return null;
        Field[] fields = list.get(j).getClass().getDeclaredFields();
        try {
          for (int i = 0; i < fields.length; i++) {
            Field f = list.get(j).getClass().getDeclaredField(fields[i].getName());
            f.setAccessible(true);
            Object o = f.get(list.get(j));
            if (o == null) {
              o = "";
            }

            reMap.put(fields[i].getName(), o.toString());
          }
        } catch (Exception e) {
          e.printStackTrace();
        }
        lm.add(reMap);
      }
    }

    return lm;
  }
  
}