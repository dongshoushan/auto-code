package com.tellyes.sm.sr.${tempPath}.controller;

import com.tellyes.core.annotation.TellyesOperation;
import com.tellyes.common.utils.StringUtil;
import com.tellyes.core.annotation.TellyesResources;
import com.tellyes.core.base.model.AjaxResponseObject;
import com.tellyes.core.constants.OpConstant;
import com.tellyes.core.constants.SecurityPolicy;
import com.tellyes.core.plugin.search.SearchOperator;
import com.tellyes.core.plugin.search.Searchable;
import com.tellyes.core.plugin.search.filter.SearchFilter;
import com.tellyes.core.plugin.search.filter.SearchFilterHelper;
import com.tellyes.core.utils.ResponseUtil;
import com.tellyes.sm.sr.entity.${tempPath}.${entityName};
import com.tellyes.sm.sr.${tempPath}.service.I${entityName}Service;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


/**
* 描述：${table_annotation}控制层
* @ClassName: ${entityName}Controller
* @author ${author}
* @date ${date}
*/
@RestController
@RequestMapping("/sr/${entityLowName}")
@TellyesResources(code = "sr.${entityLowName}", desc = "${table_annotation}")
public class ${entityName}Controller {
    @Resource
    private I${entityName}Service ${entityLowName}Service;

    /**
     * 新增
     * @param ${entityLowName}
     * @return
     */
    @TellyesOperation(code = OpConstant.ADD_CODE, desc = OpConstant.ADD_DESC)
    @RequestMapping(value = "", method = RequestMethod.POST)
    public AjaxResponseObject create(@RequestBody ${entityName} ${entityLowName}) {
        if (${entityLowName}Service.create(${entityLowName}) != 0) {
            return ResponseUtil.newContent("新增成功");
        } else {
            return new AjaxResponseObject(false, "新增失败");
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @TellyesOperation(code = OpConstant.DELETE_CODE, desc = OpConstant.DELETE_DESC)
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public AjaxResponseObject delete(@PathVariable("id") String id) {
        if (${entityLowName}Service.delete(id) != 0) {
            return ResponseUtil.newContent("删除成功");
        } else {
            return new AjaxResponseObject(false, "删除失败");
        }
    }

    /**
     * 更新
     * @param ${entityLowName}
     * @return
     */
    @TellyesOperation(code = OpConstant.EDIT_CODE, desc = OpConstant.EDIT_DESC)
    @RequestMapping(value = "", method = RequestMethod.PUT)
    public AjaxResponseObject update(@RequestBody ${entityName} ${entityLowName}) {
        if (${entityLowName}Service.update(${entityLowName}) != 0) {
            return ResponseUtil.newContent("更新成功");
        } else {
            return new AjaxResponseObject(false, "更新失败");
        }
    }

    /**
     * 查询
     * @param id
     * @return
     */
    @TellyesOperation(ploicy = SecurityPolicy.Auth)
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public AjaxResponseObject get(@PathVariable("id") String id) {
        return ResponseUtil.newContent(${entityLowName}Service.get(id));
    }
    /**
     * 查询所有,不分页
     * @return
     */
    @TellyesOperation(ploicy = SecurityPolicy.Auth)
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public AjaxResponseObject getAll() {
        return ResponseUtil.newContent(${entityLowName}Service.getAll());
    }
    /**
     * 查询分页
     * @param searchable
     * @return
     */
    @TellyesOperation(code = OpConstant.LIST_CODE, desc = OpConstant.LIST_DESC)
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public AjaxResponseObject page(Searchable searchable,String id) {
        SearchFilter filter = SearchFilterHelper.and(
                SearchFilterHelper.newCondition("is_deleted", SearchOperator.eq, 0)
        );
        searchable.addSearchFilter(filter);
        if (StringUtil.isNotEmpty(id)){
            SearchFilter searchFilter = SearchFilterHelper.newCondition("id", SearchOperator.eq, id);
            searchable.addSearchFilter(searchFilter);
        }
        return ResponseUtil.newPage(${entityLowName}Service.findPage(searchable));
    }

}
