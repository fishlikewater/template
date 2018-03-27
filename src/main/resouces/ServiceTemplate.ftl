package ${package}.service;

import ${package}.dto.${className}DTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ${package}.dao.${className}DAO;
import org.apache.commons.lang.StringUtils;

@Service
public class ${className}Service {

    @Autowired
    private ${className}DAO ${dao}DAO;
    /**
    *@param dto
    *编辑对象
    */
    public void edit(${className}DTO dto){
    <#if type == "Integer" || type == "int">
        Integer id = dto.get${id}();
        if(id != null){
            ${dao}DAO.updateIgnoreEmpty(dto);
        }else{
            ${dao}DAO.createAndId(dto);
        }
    <#else>
        String id = dto.get${id}();
        if(StringUtils.isNotBlank(id)){
            ${dao}DAO.updateIgnoreEmpty(dto);
        }else{
            ${dao}DAO.createAndId(dto);
        }
    </#if>
    }

    /**
    *@param id
    *删除
    */
    public void remove(String id){

        ${dao}DAO.removeById(id);

    }
}