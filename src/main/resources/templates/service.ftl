package com.tellyes.sm.sr.${tempPath}.service;

import com.tellyes.core.plugin.search.Searchable;
import com.tellyes.sm.sr.entity.${tempPath}.${entityName};
import org.springframework.data.domain.Page;
import java.util.List;
import java.io.Serializable;
import java.util.Map;

/**
* 描述：${table_annotation}Service
* @ClassName: I${entityName}Service
* @author ${author}
* @date ${date}
*/
public interface I${entityName}Service {
     /**
     * 新增
     * @param
     * @return
     */
    Integer create(${entityName} ${entityLowName});
    /**
     * 修改
     * @param
     * @return
     */
    Integer update(${entityName} ${entityLowName});
    /**
     * 删除（逻辑删除）
     * @param id
     * @return
     */
    Integer delete(String id);
    /**
     * 根据id查询
     * @param id
     * @return
     */
    ${entityName} get(Serializable id);
    /**
     * 查询所有不分页
     *
     * @return
     */
    List<${entityName}> getAll();
    /**
     * 高级搜索与分页
     *
     * @param search
     * @return
     */
    Page<${entityName}> findPage(Searchable search);
}
