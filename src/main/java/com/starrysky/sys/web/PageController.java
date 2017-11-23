package com.starrysky.sys.web;

import com.starrysky.sys.service.PageConfigurationService;
import com.starrysky.sys.service.OperationDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 打开页面控制层
 */
@Controller
public class PageController {

    @Autowired
    private PageConfigurationService pageConfigurationService;
    @Autowired
    private OperationDataService operationDataService;

    /**
     * 登入
     */
    @RequestMapping(value = "login",method= RequestMethod.GET)
    public String goLogin(Map<String, Object> map){
        List<Map<String, Object>> mapList = operationDataService.getRecursionData("s_menu");
        map.put("menu",mapList);
        map.put("number",0);
        System.out.println(mapList);
        return "sys/index";
    }

    /**
     * 打开列表页面
     * @param tableNameEn 表名称
     */
    @RequestMapping(value = "find/{tableNameEn}/{type}",method= RequestMethod.GET)
    public String goFind(Map<String, Object> map, @PathVariable String tableNameEn, @PathVariable String type){
        pageConfigurationService.getListField(map,tableNameEn);
        map.put("type",type);
        return "sys/find";
    }

    /**
     * 打开创建页面
     * @param tableNameEn 表名称
     */
    @RequestMapping(value = "create/{tableNameEn}",method= RequestMethod.GET)
    public String goList(@PathVariable String tableNameEn, Map<String, Object> map){
        pageConfigurationService.getCreateField(map,tableNameEn);
        return "sys/create";
    }
    /**
     * 打开更新页面
     * @param tableNameEn 表名称
     */
    @RequestMapping(value = "update/{tableNameEn}/{id}",method= RequestMethod.GET)
    public String goList(@PathVariable String tableNameEn,@PathVariable Integer id, Map<String, Object> map){
        pageConfigurationService.getUpdateField(map,tableNameEn);
        Map<String, Object> findMap = new HashMap<String, Object>();
        findMap.put("id",id);
        operationDataService.getMapData(map,tableNameEn,findMap);
        return "sys/update";
    }
    /**
     * 打开组合页面
     * @param tableNameEn 表名称
     */
    @RequestMapping(value = "combination/{tableNameEn}",method= RequestMethod.GET)
    public String goCombination(Map<String, Object> map, @PathVariable String tableNameEn){
        pageConfigurationService.getCombinationField(map, tableNameEn);
        List<Map<String, Object>> mapList = pageConfigurationService.getData(tableNameEn);
        map.put("data",mapList.get(0));
        map.put("id",mapList.get(0).get("id"));
        return "sys/combination-window";
    }

}
