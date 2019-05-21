package com.tellyes.sm.sr.${tempPath}.dao;

import com.tellyes.core.mybatis.mapper.BaseMapper;
import com.tellyes.sm.sr.entity.${tempPath}.${entityName};
import java.util.List;
/**
* 描述：${table_annotation}Dao
* @ClassName: I${entityName}Dao
* @author ${author}
* @date ${date}
*/
public interface I${entityName}Dao extends BaseMapper<${entityName}> {
    List<${entityName}> getAllList();
    List<${entityName}> getByIds(String[] id);
}
