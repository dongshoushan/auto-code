package com.tellyes.sm.sr.entity.${tempPath};

<#if model_column_remove_IdAndDate?exists>
    <#list model_column_remove_IdAndDate as model>
        <#if (model.columnType = 'TIMESTAMP'|| model.columnType = 'DATE' || model.columnType = 'DATETIME')>
import java.util.Date;
        </#if>
    </#list>
</#if>

import com.tellyes.core.base.model.BaseEntity;
import lombok.Data;
import javax.persistence.Table;
import javax.persistence.Column;

/**
* 描述：${table_annotation}实体类
* @ClassName: ${entityName}
* @author ${author}
* @date ${date}
*/
@Data
@Table(name = "${tableName}")
public class ${entityName} extends BaseEntity{

<#if model_column_remove_IdAndDate?exists>
    <#list model_column_remove_IdAndDate as model>
    /**
    *${model.columnComment!}
    */
        <#if (model.columnType = 'VARCHAR' || model.columnType = 'TEXT'|| model.columnType = 'DECIMAL' || model.columnType = 'VARBINARY')>
    private String ${model.changeColumnName?uncap_first};
        </#if>
        <#if (model.columnType = 'TIMESTAMP'|| model.columnType = 'DATE' || model.columnType = 'DATETIME')>
    private Date ${model.changeColumnName?uncap_first};
        </#if>
        <#if (model.columnType = 'INT' || model.columnType = 'INTEGER')&& model.needAnnotation !="0">
    private Integer ${model.changeColumnName?uncap_first};
        </#if>
        <#if model.columnType = 'BIGINT' && model.needAnnotation !="0" >
    private Long ${model.changeColumnName?uncap_first};
        </#if>
        <#if model.needAnnotation ="0">
    @Column(name = "${model.columnName}")
    private Boolean ${model.changeColumnName?uncap_first};
        </#if>
        <#if model.columnType = 'BIGDECIMAL' >
    private BigDecimal ${model.changeColumnName?uncap_first};
        </#if>
        <#if model.columnType = 'FLOAT' >
    private Float ${model.changeColumnName?uncap_first};
        </#if>
    </#list>
</#if>

}