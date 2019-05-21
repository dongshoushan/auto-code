<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.tellyes.sm.sr.${tempPath}.dao.I${entityName}Dao">
    <resultMap id="${entityLowName}Map" type="com.tellyes.sm.sr.entity.${tempPath}.${entityName}">
        <id column="id" jdbcType="BIGINT" property="id"></id>
        <#list model_column_removeId as model>
        <result column="${model.columnName}" jdbcType="${model.columnType}" property="${model.changeColumnName}"></result>
        </#list>
    </resultMap>
    <sql id="${entityLowName}_Column_List">
        <#list model_column_removeId as model>${model.columnName},</#list>id
    </sql>
    <select id="getAllList" resultMap="${entityLowName}Map">
        select <include refid="${entityLowName}_Column_List"/> from  ${tableName}
        where is_deleted = 0;
    </select>
    <select id="getByIds" resultType="com.tellyes.sm.sr.entity.${tempPath}.${entityName}">
        select <include refid="${entityLowName}_Column_List"/> from  ${tableName}
        where id in
        <foreach collection="array" item="ids" index="index"
                 open="(" close=")" separator=",">
        ${r'#{ids}'}
        </foreach>
    </select>
</mapper>