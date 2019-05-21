package com.tellyes.sm.sr.${tempPath}.service.impl;

import com.tellyes.core.exception.ServiceException;
import com.tellyes.core.plugin.search.SearchOperator;
import com.tellyes.core.plugin.search.Searchable;
import com.tellyes.core.plugin.search.filter.SearchFilter;
import com.tellyes.core.plugin.search.filter.SearchFilterHelper;
import com.tellyes.sm.sr.${tempPath}.dao.I${entityName}Dao;
import com.tellyes.sm.sr.entity.${tempPath}.${entityName};
import com.tellyes.sm.sr.${tempPath}.service.I${entityName}Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
/**
* 描述：${table_annotation}实现类
* @ClassName: I${entityName}ServiceImpl
* @author ${author}
* @date ${date}
*/
@Service
@Transactional(rollbackFor = Exception.class)
public class ${entityName}ServiceImpl implements I${entityName}Service {
    @Resource
    private I${entityName}Dao ${entityLowName}Dao;

    @Override
    public Integer create(${entityName} ${entityLowName}) {
        return ${entityLowName}Dao.create(${entityLowName});
    }

    @Override
    public Integer update(${entityName} ${entityLowName}) {
        return ${entityLowName}Dao.update(${entityLowName});
    }

    @Override
    public Integer delete(String id) {
        JSONObject jasonObject = JSONObject.fromObject(id);
        String str = jasonObject.get("id").toString();
        List<${entityName}> ${entityLowName}List = ${entityLowName}Dao.getByIds(str.split(","));
        ${entityLowName}List.forEach(${entityLowName} -> ${entityLowName}.setDeleted(true));
        Integer integer = ${entityLowName}Dao.batchUpdate(${entityLowName}List);
        return integer;
    }

    @Override
    public ${entityName} get(Serializable id) {
        return ${entityLowName}Dao.get(id);
    }
    @Override
    public List<${entityName}> getAll() {
        return ${entityLowName}Dao.getAllList();
    }
    @Override
    public Page<${entityName}> findPage(Searchable search) {
        Pageable pageable = search.getPage();
        return ${entityLowName}Dao.findPage(search,pageable);
     }
}
