package ${package}.dao;

import ${package}.dto.${className}DTO;
import scorpio.annotation.Table;
import scorpio.core.BaseDAO;

@Table(pojo = ${className}DTO.class,table = "${table}"<#if fileMapper??>, fileMapper = "${fileMapper}" </#if>)
public class ${className}DAO extends BaseDAO<${className}DTO> {


    }